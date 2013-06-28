#!/bin/bash
#
# 
if [ "$#" == "0" ]; then
# No arguments provided, do it for every .srt file?
	read -r -p "No arguments provided, change all files in folder to utf8? [Y/n]" response
	response=${response,,} # tolower
	if [[ $response =~ ^(yes|y| ) ]]; then
		for file in *.srt; do
			mv "$file" "${file%.srt}.old.srt"
			iconv -f ISO_8859-15 -t UTF-8 "${file%.srt}.old.srt" -o "${file}"
			rm "${file%.srt}.old.srt"
		done    
	else
		echo "Doing nothing"
	fi
else
	mv "$1" "${1%.srt}.old.srt"
	iconv -f ISO_8859-15 -t UTF-8 "${1%.srt}.old.srt" -o "${1}"
	rm "${1%.srt}.old.srt"	
fi
