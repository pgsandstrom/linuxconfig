#!/usr/bin/env bash
while read -r line 
do
	WINDOW_ID="$(echo  $line | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')"
	if (("$WINDOW_ID" == "0x0")); then
		continue
	fi
	NAME=$(xprop -id $WINDOW_ID | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
	CURRENT_KEYBOARD="$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')"
	if ([[ $NAME == *"Google Chrome"* ]] || [[ $NAME == *"Firefox"* ]]) && (("$CURRENT_KEYBOARD" == "us")); then
		$(setxkbmap -model pc105 -layout "se") 
	elif (("$CURRENT_KEYBOARD" == "se")); then
		$(setxkbmap -model pc105 -layout "us") 
	fi
done < <(xprop -spy -root _NET_ACTIVE_WINDOW 2>/dev/null)
