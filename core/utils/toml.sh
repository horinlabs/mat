#!/usr/bin/env bash

# toml_get <key> <file>
toml_get() {
  local key="$1"
  local file="$2"

  grep -E "^$key\s*=" "$file" \
    | sed -E "s/^$key\s*=\s*\"?(.*)\"?/\1/"
}
