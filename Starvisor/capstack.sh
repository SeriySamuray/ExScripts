#!/bin/bash

###############################################################
# Uploading the captured stack to the Starvisor website page. #
###############################################################
capture_dir="$(dirname "$1")"
data_dir="$(dirname "$capture_dir")"
Station="$(basename "$data_dir")"

# Get values from config file
# source $(dirname $0)/.starvisor.cfg
source "$HOME/source/Stations/$Station/.starvisor.cfg"

echo -e "Working: directory: \n$1\n"

# Captured stack pattern
capstack="$1/*_captured_stack.jpg"

# Upload a stack to site
ftp-upload \
		--verbose \
		--host $FTP_LIVE \
		--user $USER_LIVE \
		--password $PASSWD_LIVE \
		--passive \
		--as $ID'.jpg' \
			$capstack

exit 0

