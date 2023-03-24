#!/bin/sh

set -e

if [ $# -lt 3 ]; then
  echo "Usage: dreadnought_shutdown.sh <user> <address> <port>"
  exit 1
fi

if ping -c 1 -W 1 $2 > /dev/null 2>&1; then
  HOST=$1@$2
  # sending a shutdown command via ssh will result in an error since the
  # connection is interrupted, let's ignore it so we don't get an error in home
  # assistant. Unfortunately that also means we can't check if this command
  # actually worked.
  ssh -p $3 $HOST 'shutdown /s /t 0' || true
fi
