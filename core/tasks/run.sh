#!/usr/bin/env bash
set -e

TASK_NAME=$1

if [[ -z "$TASK_NAME" ]]; then
  echo "[MAT] No task specified."
  exit 1
fi

BASE_DIR="$(dirname "$0")/../.."
TOML="$BASE_DIR/mat.toml"
UTILS="$BASE_DIR/core/utils/toml.sh"

source "$UTILS"

# Read task from TOML
TASK_PATH=$(toml_get "tasks.$TASK_NAME" "$TOML")

if [[ -z "$TASK_PATH" ]]; then
  echo "[MAT] Task '$TASK_NAME' not found in mat.toml"
  exit 1
fi

SCRIPT="$BASE_DIR/$TASK_PATH"

if [[ ! -f "$SCRIPT" ]]; then
  echo "[MAT] Task script not found: $SCRIPT"
  exit 1
fi

echo "🟦 MAT — Running task: $TASK_NAME"
echo "--------------------------------"

bash "$SCRIPT"
