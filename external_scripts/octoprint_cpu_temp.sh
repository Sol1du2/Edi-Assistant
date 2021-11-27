#!/bin/sh

set -e

if [ $# -lt 3 ]; then
  echo "Usage: octoprint_cpu_temp.sh <user> <address> <port>"
  exit 1
fi

if ping -c 1 -W 1 $2 > /dev/null 2>&1; then
  HOST=$1@$2
  ssh -p $3 $HOST '/bin/cat /sys/class/thermal/thermal_zone0/temp'
else
  echo "Unavailable"
fi