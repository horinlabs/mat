#!/usr/bin/env bash
set -e

SCRIPT=$1

if [[ ! -f "$SCRIPT" ]]; then
  echo "[MAT] Task script not found: $SCRIPT"
  exit 1
fi

bash "$SCRIPT"
