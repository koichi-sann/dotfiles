#!/usr/bin/env bash

FILE="$HOME/.cache/eww_koichi.dashboard"
ewwcfg="$HOME/.config/bspwm/rices/koichi/dashboard"
EWW=`which eww`

if [[ ! `pidof eww` ]]; then
	${EWW} -c $HOME/.config/bspwm/rices/koichi/dashboard daemon &
	sleep 1
fi

launch_eww() {
	${EWW} --config "$ewwcfg" open dashboard
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	launch_eww
else
	${EWW} --config "$ewwcfg" close dashboard
	rm "$FILE"
fi
