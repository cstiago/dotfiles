#!/bin/bash

# Work on a temporary directory
TEMP=$(mktemp -d)
cd $TEMP

# Clone dotfiles
git clone https://github.com/cstiago/dotfiles.git
cd dotfiles

# Install packages from APT
sed 's/#.*//' install/apt.txt | xargs sudo apt -y install
