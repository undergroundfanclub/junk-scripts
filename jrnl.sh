#!/bin/bash
FILE=~/junk/jrnl/$(date "+%F").md
if [ -f "$FILE" ]; then
	echo "a $(date "+%F").md entry exists, would you like to edit?"
	
	read -rp "[Y/n]: " -e
	
	if [[ ( "$REPLY" == y ) || ( -z "$REPLY" ) ]]
	then
		nvim $FILE
	else
		echo "aborting"
		exit 1
	fi
else
	mkdir ~/junk
	mkdir ~/junk/jrnl
	echo "$FILE did not exist...until now"
	nvim $FILE
fi
