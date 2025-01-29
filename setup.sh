#!/bin/bash

# Work on a temporary directory
TEMP=$(mktemp -d)
cd $TEMP

# Clone dotfiles
git clone https://github.com/cstiago/dotfiles.git
cd dotfiles

# Setup SSH keys
ssh-keygen -t ed25519 -C $(hostnamectl | grep Static | awk '{print $3}')

# Set package options
sudo debconf-set-selections <<< "postfix postfix/mailname string $(hostname --long).localdomain"
sudo debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"

# Install packages from APT
sed 's/#.*//' inst/apt.txt | xargs -n 1 sudo apt -y install

# Add Flathub repository to Flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install packages from Flatpak
sed 's/#.*//' inst/flatpak.txt | xargs flatpak --or-update -y install 

# Install fonts
cat inst/fonts.txt | xargs wget -P fonts
mkdir -p ~/.local/share/fonts
cp fonts/*.ttf ~/.local/share/fonts
fc-cache -f -v
