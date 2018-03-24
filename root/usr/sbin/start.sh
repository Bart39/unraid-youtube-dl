#!/bin/bash

while true; do

	youtube-dl --download-archive /config/archive -u $USERNAME -p $PASSWORD --mark-watched \
	-i -o "/downloads/%(playlist_uploader)s/%(playlist_title)s/%(playlist_title)s - S01E0%(playlist_index)s - %(title)s [%(id)s].%(ext)s" \
	-f bestvideo[ext=mp4]+bestaudio[ext=m4a] \
	--merge-output-format mp4 --add-metadata --write-thumbnail \
	--external-downloader aria2c \
	--external-downloader-args "-c -j 3 -x 3 -s 3 -k 1M" \
	--batch-file=/config/playlist.txt

	chmod -R 777 /downloads/

	echo "Done Sleeping for $INTERVAL seconds"
	sleep $INTERVAL
done
