#!/bin/sh
set -eu

if [ $# -lt 3 ]; then
  echo "Usage: ssh_shutdown.sh <user> <address> <port>" >&2
  exit 1
fi

USER="$1"
ADDR="$2"
PORT="$3"
HOST="${USER}@${ADDR}"

if ping -c 1 -W 1 "$ADDR" >/dev/null 2>&1; then
  # --no-block returns right away (less likely to error due to disconnect)
  ssh -p "$PORT" \
    -o BatchMode=yes \
    -o ConnectTimeout=5 \
    "$HOST" \
    "sudo -n shutdown -h now" \
    >/dev/null 2>&1 || true
fi
