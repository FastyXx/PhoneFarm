#!/bin/bash

# Installation directory
INSTALL_DIR="/sdcard/ccminer"

# Name of the ccminer process
PROCESS_NAME="ccminer"

# Start ccminer
~/ccminer/ccminer -c ~/ccminer/config.json &

# Monitor ccminer and restart if it stops
while true; do
  ps aux | grep "$PROCESS_NAME" > /dev/null
  if [ $? -ne 0 ]; then
    echo "ccminer is not running, restarting..."
    ~/ccminer/ccminer -c ~/ccminer/config.json &
  fi
  sleep 60
done
