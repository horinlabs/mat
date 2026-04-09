#!/usr/bin/env bash
set -e

echo "🟦 MAT — Raspberry Pi Bootstrap"
echo "--------------------------------"

# --- Detect OS --------------------------------------------------------------

OS=$(grep '^ID=' /etc/os-release | cut -d= -f2)
ARCH=$(uname -m)

echo "[MAT] OS: $OS"
echo "[MAT] ARCH: $ARCH"

if [[ "$OS" != "raspbian" && "$OS" != "debian" ]]; then
  echo "[MAT] Unsupported OS. This script is optimized for Raspberry Pi OS / Debian."
  exit 1
fi

# --- Update System ----------------------------------------------------------

echo "[MAT] Updating system..."
sudo apt update -y
sudo apt upgrade -y

# --- Essentials -------------------------------------------------------------

echo "[MAT] Installing essentials..."
sudo apt install -y \
  git \
  curl \
  wget \
  vim \
  htop \
  unzip \
  ca-certificates \
  gnupg \
  lsb-release \
  net-tools \
  avahi-daemon

# --- Hostname ---------------------------------------------------------------

NEW_HOSTNAME="mat-pi"
echo "[MAT] Setting hostname to $NEW_HOSTNAME..."
sudo hostnamectl set-hostname "$NEW_HOSTNAME"

# --- SSH --------------------------------------------------------------------

echo "[MAT] Enabling SSH..."
sudo systemctl enable ssh
sudo systemctl start ssh

# --- Timezone ---------------------------------------------------------------

echo "[MAT] Setting timezone to America/Sao_Paulo..."
sudo timedatectl set-timezone America/Sao_Paulo

# --- Locale -----------------------------------------------------------------

echo "[MAT] Configuring locale..."
sudo sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sudo locale-gen
sudo update-locale LANG=en_US.UTF-8

# --- Create MAT User --------------------------------------------------------

if ! id "mat" >/dev/null 2>&1; then
  echo "[MAT] Creating user 'mat'..."
  sudo useradd -m -s /bin/bash mat
  sudo usermod -aG sudo mat
  echo "mat:mat" | sudo chpasswd
fi

# --- Docker Install ---------------------------------------------------------

echo "[MAT] Installing Docker..."

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh

sudo usermod -aG docker "$USER"
sudo usermod -aG docker mat

# --- Docker Compose Plugin --------------------------------------------------

echo "[MAT] Installing Docker Compose plugin..."
sudo apt install -y docker-compose-plugin

# --- MAT Directory ----------------------------------------------------------

echo "[MAT] Creating MAT directory..."
sudo mkdir -p /opt/mat
sudo chown -R "$USER":"$USER" /opt/mat

# --- Finished ---------------------------------------------------------------

echo ""
echo "🟦 MAT Bootstrap Complete"
echo "--------------------------------"
echo "• Hostname: $NEW_HOSTNAME"
echo "• SSH enabled"
echo "• Docker installed"
echo "• User 'mat' created"
echo "• System ready for MAT services"
echo ""
echo "You may need to log out and back in for Docker permissions to apply."
