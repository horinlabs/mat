#!/usr/bin/env bash
TASK=$1
bash "$(tomlq -r ".tasks.$TASK" mat.toml)"
