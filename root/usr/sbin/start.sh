#!/bin/bash

while true; do

	youtube-dl --download-archive /config/archive -u $USERNAME -p $PASSWORD --mark-watched -r 2M \
	-i -o "/downloads/%(playlist_uploader)s/%(playlist_title)s/%(playlist_title)s - S01E0%(playlist_index)s - %(title)s [%(id)s].%(ext)s" \
	-f bestvideo[ext=mp4]+bestaudio[ext=m4a] \
	--merge-output-format mp4 --add-metadata --write-thumbnail \
	--batch-file=/config/playlist.txt

	chmod -R 777 /downloads/

	echo "Done Sleeping for $INTERVAL seconds"
	sleep $INTERVAL
done
