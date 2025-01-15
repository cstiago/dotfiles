#!/bin/bash

# Work on a temporary directory
TEMP=$(mktemp -d)
cd $TEMP

# Clone dotfiles
git clone https://github.com/cstiago/dotfiles.git
cd dotfiles

# Setup SSH keys
ssh-keygen -t ed25519 -C $(hostnamectl | grep Static | awk '{print $3}')

# Install packages from APT
sed 's/#.*//' install/apt.txt | xargs sudo apt -y install

# Install fonts
cat install/fonts.txt | xargs wget -P fonts
mkdir -p ~/.local/share/fonts
cp fonts/*.ttf ~/.local/share/fonts
fc-cache -f -v
