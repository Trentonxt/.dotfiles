#!/bin/bash

LOG_FILE=~/linuxsetup.log

# checks if the operating system is linux
if [ $(uname) != "Linux" ]; then
    echo "Error: script only works on Linux" >> "$LOG_FILE"
    exit 1
fi

# creates a trash directory in home if one does not already exist
if [ ! -d "$HOME/.TRASH" ]; then
    mkdir "$HOME/.TRASH"
    echo "Created .Trash directory." >> "$LOG_FILE"
fi

#if a .nanorc file exist, it is renamed to .bup_nanorc
if [ -f "$HOME/.nanorc" ]; then
    mv "$HOME/.nanorc" "$HOME/.bup_nanorc"
    echo "Current .nanorc file changed to .bup_nanorc" >> "$LOG_FILE"
fi

#redirects contents of ./etc/nanorc to .nanorc
cp ~/.dotfiles/etc/nanorc "$HOME/.nanorc"
echo "Copied ~/.dotfiles/etc/nanorc to $HOME/.nanorc" >> "$LOG_FILE"


echo 'source ~/.dotfiles/etc/bashrc custom' >> "$HOME/.bashrc"
