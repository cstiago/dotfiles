#!/bin/bash

sed 's/#.*//' install/apt.txt | xargs sudo apt -y install

install-discord
install-vscode
install-insomnia
install-postman
install-compass
