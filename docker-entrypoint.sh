#!/bin/sh
set -eu

TOKEN_DIR="/root/.garminconnect"
SECRET_TOKEN="/etc/secrets/garmin_tokens.json"

mkdir -p "$TOKEN_DIR"

if [ -f "$SECRET_TOKEN" ]; then
    echo "Instalando token Garmin do Secret File..."
    cp "$SECRET_TOKEN" "$TOKEN_DIR/garmin_tokens.json"
    chmod 600 "$TOKEN_DIR/garmin_tokens.json"
else
    echo "Aviso: Secret File garmin_tokens.json não encontrado."
fi

exec garmin-mcp "$@"
