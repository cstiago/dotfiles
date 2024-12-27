#!/bin/bash

sed 's/#.*//' install/apt.txt | xargs sudo apt -y install
