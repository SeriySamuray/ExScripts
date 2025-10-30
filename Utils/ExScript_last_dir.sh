#!/bin/bash

#################################################
# Run external script in last processed folders #
#################################################
Station=$1

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
