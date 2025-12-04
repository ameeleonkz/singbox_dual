#!/bin/sh
set -e

# Default values if not provided (optional)
: "${SINGBOX_SERVER_PORT:=443}"
: "${SINGBOX_SNI:=www.apple.com}"

# Generate config.json from template + env vars
envsubst < /etc/sing-box/config.template.json > /etc/sing-box/config.json

echo "[entrypoint] Generated /etc/sing-box/config.json"
exec sing-box run -c /etc/sing-box/config.json
