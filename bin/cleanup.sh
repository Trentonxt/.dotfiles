#!/bin/bash

LOG_FILE=~/linxsetup.log

# removes .nanorc from directory
if [ -f "$HOME/.nanorc" ]; then
	rm "$HOME/.nanorc"
	echo "Removed .nanorc file from home directory." >> "$LOG_FILE"
fi

	sed -i '/source ~\/.dotfiles\/etc\/bashrc custom/d' "$HOME/.bashrc"

# removes .TRASH from directory
if [ -d "$HOME/.TRASH" ]; then
	rm -rf "$HOME/.TRASH"
	echo "Removed .TRASH directory." >> "$LOG_FILE"
fi
