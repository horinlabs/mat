#!/usr/bin/env bash

set -e

SECTION=$1

BASE_DIR="$(dirname "$0")"

print_section() {
  local file="$BASE_DIR/sections/$1.txt"
  if [[ -f "$file" ]]; then
    cat "$file"
  else
    echo "[MAT] No help available for '$1'"
  fi
}

if [[ -z "$SECTION" ]]; then
  cat "$BASE_DIR/commands.txt"
  exit 0
fi

print_section "$SECTION"
