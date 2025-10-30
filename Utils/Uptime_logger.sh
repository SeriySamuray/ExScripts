#!/bin/bash
# Chech uptime RPi.
Station=$1
echo -e $(date) "\n" $(uptime) "\n" >> "$HOME/RMS_data/"$Station"/uptime.log"
exit 0
