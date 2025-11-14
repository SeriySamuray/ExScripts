#!/bin/bash

########################
# Camera Reboot Script #
########################
Station=$1

# reboot
TF_CPP_MIN_LOG_LEVEL=3 python -m Utils.CameraControl reboot --config /home/pi/source/Stations/$Station/.config

exit 0
