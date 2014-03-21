#!/bin/bash

root="$HOME/.config/pianobar"
ctlf="$root/ctl"
lyricsfile="$root/lyrics.sh"

while read L; do
    k="`echo "$L" | cut -d '=' -f 1`"
    v="`echo "$L" | cut -d '=' -f 2`"
    export "$k=$v"
done < <(grep -e '^\(title\|artist\|album\|stationName\|pRet\|pRetStr\|wRet\|wRetStr\|songDuration\|songPlayed\|rating\|songDuration\|songPlayed\|coverArt\|stationCount\|station[0-9]\+\)=' /dev/stdin)

case "$1" in
    songstart)
      echo -e "glyrc lyrics -a \"$artist\" -t \"$title\" -b \"$album\" -w /tmp/" > "$lyricsfile"
      /usr/local/bin/terminal-notifier -subtitle  "Artist: $artist" -message "Album: $album" -title "$title"
;;
esac
