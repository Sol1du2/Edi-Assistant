#!/bin/sh

set -e

if [ $# -lt 1 ]; then
  echo "Usage: octoprint_availability_check.sh <address>"
  exit 1
fi

if ping -c 1 -W 1 $1 > /dev/null 2>&1; then
  echo "available"
else
  echo "unavailable"
fi