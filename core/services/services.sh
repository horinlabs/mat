#!/usr/bin/env bash
ACTION=$1
SERVICE=$2

case "$ACTION" in
  deploy)
    docker compose -f "core/services/$SERVICE/docker-compose.yml" up -d
    ;;
  *)
    echo "Usage: mat services deploy <service>"
    ;;
esac
