#!/bin/bash

########################
# Camera Reboot Script #
########################
if [ -z "$1" ]; then
    echo "Error, no <Station>." 
	echo "Use: $0 <Station>"
    exit 1
fi
Station=$1
PATH_CONFIG=/home/pi/source/Stations/$Station/.config

if [ -e "$PATH_CONFIG" ]; then
    # reboot
	TF_CPP_MIN_LOG_LEVEL=3 python -m Utils.CameraControl reboot --config $PATH_CONFIG
else
    echo "No such file or directory."
	echo "Check <Station>"
fi

exit 0
