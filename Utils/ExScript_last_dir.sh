#!/bin/bash

#################################################
# Run external script in last processed folders #
#################################################

# Check <Station> is passed
if [ -z "$1" ]; then
    echo "Error, no <Station>." 
	echo "Use: $0 <Station>"
    exit 1
fi
Station=$1
PATH_Station=$HOME/RMS_data/$Station

# Check <Station> is correct
if [ ! -e "$PATH_Station" ]; then
    echo "No such file or directory."
	echo "Check <Station>"
	exit 1
fi

# Activate RMS
source $HOME/vRMS/bin/activate
cd $HOME/source/RMS


# Last CaptutedFiles folder
capt=$(\
	ls \
		-t \
		--directory \
			$HOME/RMS_data/$Station/CapturedFiles/* \
			| head -1\
	)

# Last ArchivedFiles folder
arh=$(\
	ls \
		-t \
		--directory \
		--group-directories-first \
			$HOME/RMS_data/$Station/ArchivedFiles/* \
			| head -1\
	)


# Print path of folders:
echo "
Working directories:
==============================================================
$capt
$arh
==============================================================
Starting ExternalScript...
"

# Run ExternalScript
python -m RMS.RunExternalScript $capt $arh

exit 0
