#!/bin/sh

if ! updates_arch=$(checkupdates-aur 2> /dev/null | wc -l); then
    updates_arch=0
fi

# if ! updates_aur=$(paru -Syu 2> /dev/null | wc -l); then
#     updates_aur=0
# fi

updates=$((updates_arch))

if [ "$updates" -gt 0 ]; then
    echo "$updates"
else
    echo "0"
fi
