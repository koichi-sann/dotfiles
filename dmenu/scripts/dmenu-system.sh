#!/usr/bin/env bash

set -euo pipefail

declare -a options=(
  "Logout"
  "Reboot"
  "Shutdown"
  "Suspend"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -theme "$HOME/.config/bspwm/rices/$RICETHEME/launcher.rasi")

case $choice in 
  'Logout')
    answer="$(echo -e "No\nYes" | rofi -dmenu -theme "$HOME/.config/bspwm/rices/$RICETHEME/launcher.rasi")"

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
    answer="$(echo -e "No\nYes" | rofi -dmenu -theme "$HOME/.config/bspwm/rices/$RICETHEME/launcher.rasi")" 
    if [[ $answer == "Yes" ]]; then
      loginctl reboot
    fi

    if [[ $answer == "No" ]]; then 
      echo "User chose not to reboot." && exit 1
    fi
    ;;
  'Shutdown')
    answer="$(echo -e "No\nYes" | rofi -dmenu -theme "$HOME/.config/bspwm/rices/$RICETHEME/launcher.rasi")"  
    if [[ $answer == "Yes" ]]; then
      loginctl poweroff
    fi

    if [[ $answer == "No" ]]; then 
      echo "User chose not to shutdown." && exit 1
    fi
    ;;
  'Suspend')
    answer="$(echo -e "No\nYes" | rofi -dmenu -theme "$HOME/.config/bspwm/rices/$RICETHEME/launcher.rasi")"  
    if [[ $answer == "Yes" ]]; then
      loginctl suspend
    fi

    if [[ $answer == "No" ]]; then 
      echo "User chose not to suspend." && exit 1
    fi
    ;;
  *)
    exit 1
    ;;
esac
