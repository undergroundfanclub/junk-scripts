#obviously requires neovim to run
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
	mkdir ~/junk > /dev/null 2>&1
	mkdir ~/junk/jrnl > /dev/null 2>&1

	touch $FILE
	echo '<div class="metadata data">'$(date "+%F")'</div>' >> $FILE
	echo '<div class="metadata author">ungder@pmch</div>' >> $FILE
	echo '# TITLE' >> $FILE
	echo "$FILE did not exist...until now"
	nvim $FILE
fi
