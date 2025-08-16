#!/bin/bash

cd ~
mkdir -p ~/bin

# Install my binaries
for FILE in $(ls ~/dotfiles-raspi/bin);
do
    cp ~/dotfiles-raspi/bin/$FILE ~/bin
    chmod +x ~/bin/$FILE
done

# Create .dotfiles from dotfiles/files (backup old ones and move newer ones)
mkdir -p ~/dotfiles-raspi_old
for FILE in $(ls ~/dotfiles-raspi/dotfiles);
do
    [ -f ~/.$FILE ] && mv ~/.$FILE ~/dotfiles-raspi_old/
    cp ~/dotfiles-raspi/dotfiles/$FILE ~/.$FILE
done

source ~/.bash_profile
