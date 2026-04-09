# 🟦 Minimalist Automation Toolkit (MAT)

MAT is a minimalist, open‑source automation toolkit designed for developers, homelabbers, and small businesses who want **clean, reliable, low‑friction automation** without the complexity of full orchestration platforms.

Built with a Japanese–German–Swiss design philosophy:
- **Simple**
- **Predictable**
- **Minimal**
- **Beautifully engineered**

MAT helps you automate:
- Raspberry Pi setups  
- Home servers  
- Small business infrastructure  
- Backups, monitoring, and scheduled tasks  
- Docker-based services  
- Lightweight workflows  

---

## ✨ Features (v1.0)
- **Task Runner** — human‑readable YAML automation tasks  
- **Backup Manager** — local + cloud backup scripts  
- **Service Templates** — curated Docker Compose stacks  
- **Pi Bootstrap** — one‑command Raspberry Pi setup  
- **Network Tools** — uptime checks, port checks, LAN scan  
- **Zero Bloat** — no databases, no agents, no dashboards (unless you want them)

---

## 🧩 Philosophy
MAT follows three core principles:

1. **Minimalism**  
   Every file, function, and command must earn its place.

2. **Determinism**  
   Scripts must behave the same way every time.

3. **Transparency**  
   No magic. No hidden processes. Everything is visible.

---

## 🏗️ High-Level Architecture

```
mat/
 ├── mat.sh                 # Main CLI entrypoint
 ├── core/                  # Core automation modules
 │    ├── tasks/            # Task runner
 │    ├── backup/           # Backup manager
 │    ├── services/         # Docker templates
 │    ├── network/          # Network tools
 │    └── utils/            # Shared utilities
 ├── examples/              # Example tasks and templates
 ├── docs/                  # Documentation
 └── mat.toml               # Project manifest (TOML)
```

### Components

#### **1. CLI (mat.sh)**
The command-line interface that routes all commands:
- `mat run <task>`
- `mat backup`
- `mat services deploy <name>`
- `mat pi bootstrap`

#### **2. Core Modules**
Each module is a self-contained, minimal shell script.

#### **3. Manifest (mat.toml)**
Defines:
- tasks  
- backup targets  
- service templates  
- environment variables  

#### **4. Templates**
Docker Compose stacks for:
- Traefik  
- Pi-hole  
- Home Assistant  
- Portainer  
- Filebrowser  
- MariaDB/Postgres  

---

## 🚀 Getting Started

### Install
```bash
git clone https://github.com/YOUR_USERNAME/mat
cd mat
chmod +x mat.sh
```

### Run a task
```bash
./mat.sh run backup_daily
```

### Deploy a service
```bash
./mat.sh services deploy pihole
```

### Bootstrap a Raspberry Pi
```bash
./mat.sh pi bootstrap
```

---

## 📦 Roadmap
- MAT Pro (premium templates)
- Remote dashboard (optional SaaS-lite)
- Pi cluster manager
- Encrypted backup system
- Monitoring + alerts

---

## 💙 Support the Project
If MAT helps you, consider supporting development:

- GitHub Sponsors  
- Buy Me a Coffee  
- Paid support sessions  
- MAT Pro add-ons  

---

## 📝 License
MIT License  
Minimal restrictions. Maximum freedom.
