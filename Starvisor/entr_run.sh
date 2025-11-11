#!/bin/bash

########################################################
# Run upload scripts when current stack is overwritten #
########################################################
Station=$1

# 1. Enable display of current stack in ~/RMS_data folder
#
# nano ~/source/RMS/.config
#
# ; Enable/disable saving a live.jpg file in the data directory with the latest image
# live_jpg: true


# 2. Add a script to autorun to track changes to the live.jpg file.
#
# For RPi3 Jessie:
# sudo nano /home/pi/.config/lxsession/LXDE-pi/autostart
#
# For RPi4 Buster or Bullseye
# sudo nano /etc/xdg/lxsession/LXDE-pi/autostart
#
#
# Add:
#
# For RPi3 Jessie, RPi4 Buster:
# # Starvisor
# /home/pi/source/ExScripts/Starvisor/entr_run.sh &
#
# For RPi4 Bullseye:
# # Starvisor
# /home/rms/source/ExScripts/Starvisor/entr_run.sh &


WATCH_FILE="$HOME/RMS_data/$Station/live.jpg"
SCRIPT="$HOME/source/ExScripts/Starvisor/live_vps.sh"

printf "%s\n" "$WATCH_FILE" | entr -np "$SCRIPT" "$Station"