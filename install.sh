#!/bin/bash

echo "Installing pip"

sudo easy_install pip

echo "Installing ansible via pip"

sudo pip install ansible --quiet
