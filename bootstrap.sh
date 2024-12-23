#!/bin/bash

sed 's/#.*//' packages/apt | xargs sudo apt -y install
