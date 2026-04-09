#!/usr/bin/env bash

set -e

COMMAND=$1
SUBCOMMAND=$2
ARG=$3

case "$COMMAND" in
  run)
    ./core/tasks/run.sh "$SUBCOMMAND"
    ;;
  backup)
    ./core/backup/backup.sh
    ;;
  services)
    ./core/services/services.sh "$SUBCOMMAND" "$ARG"
    ;;
  pi)
    ./core/pi/bootstrap.sh
    ;;
  help)
    ./core/help/help.sh "$SUBCOMMAND"
    ;;
  *)
    echo "MAT — Minimalist Automation Toolkit"
    echo "Usage: mat <run|backup|services|pi>"
    ;;
esac
