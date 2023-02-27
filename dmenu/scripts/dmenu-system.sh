#!/usr/bin/env bash

set -euo pipefail

declare -a options=(
  "Logout"
  "Reboot"
  "Shutdown"
  "Suspend"
  "Quit"
)

choice=$(printf '%s\n' "${options[@]}" | dmenu -c -l 10 -i -p 'Shutdown menu:')

case $choice in 
  'Logout')
    answer="$(echo -e "No\nYes" | dmenu -c -l 10 -i -p "Logout?")"

    if [[ $answer == "Yes" ]]; then
      killall awesome || echo "Process was not running."
      killall dwm || echo "Process was not running."
      killall xmonad || echo "Process was not running."
      killall bspwm || echo "Process was not running."
    fi

    if [[ $answer == "No" ]]; then 
      echo "User chose not to logout." && exit 1
    fi
    ;;
  'Reboot')
    answer="$(echo -e "No\nYes" | dmenu -c -l 10 -i -p "Reboot?")"

    if [[ $answer == "Yes" ]]; then
      loginctl reboot
    fi

    if [[ $answer == "No" ]]; then 
      echo "User chose not to reboot." && exit 1
    fi
    ;;
  'Shutdown')
    answer="$(echo -e "No\nYes" | dmenu -c -l 10 -i -p "Shutdown?")"

    if [[ $answer == "Yes" ]]; then
      loginctl poweroff
    fi

    if [[ $answer == "No" ]]; then 
      echo "User chose not to shutdown." && exit 1
    fi
    ;;
  'Suspend')
    answer="$(echo -e "No\nYes" | dmenu -c -l 10 -i -p "Suspend?")"

    if [[ $answer == "Yes" ]]; then
      loginctl suspend
    fi

    if [[ $answer == "No" ]]; then 
      echo "User chose not to suspend." && exit 1
    fi
    ;;
  'Quit')
    echo "Program terminated." && exit 1
    ;;
  *)
    exit 1
    ;;
esac
