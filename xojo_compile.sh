#!/bin/sh

echo "Building $1"

osascript -e "set the clipboard to \"$1\""

osascript -e '
tell application "Xojo" to activate

tell application "System Events"
	tell process "Xojo"
		tell menu bar 1
			tell menu 3
				click
				key code 125
				key code 125
				key code 125
				key code 125
				key code 125
				key code 125
				key code 125
				key code 125
				key code 125
				key code 125
				key code 125
				key code 124
				key code 125
				keystroke return
			end tell
		end tell
	end tell
end tell'
