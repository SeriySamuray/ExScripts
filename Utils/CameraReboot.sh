#!/bin/bash

########################
# Camera Reboot Script #
########################
if [ -z "$1" ]; then
    echo "Error, no <Station>. Use: $0 <Station>"
    exit 1
fi
Station=$1

# reboot
TF_CPP_MIN_LOG_LEVEL=3 python -m Utils.CameraControl reboot --config /home/pi/source/Stations/$Station/.config

exit 0
