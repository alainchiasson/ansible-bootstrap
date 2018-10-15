#!/usr/bin/env bash
#
# Sets up requirements to provision with ansible
#

#
# Clean display function
#
# usage:
#        display "My thing to output"
#
function display() {
    echo "----> $1"
}

if [ ! `command pip` ]
then
    display "Installing pip"
    easy_install pip
fi

# Install Ansible
display "Installing Ansible"
pip install --upgrade ansible

# if [ ! `which brew` ]
# then
#     display "Installing Homebrew"
#     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# fi

ansible-playbook -i "localhost," -c local playbook.yml
