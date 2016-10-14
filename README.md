# ansible-bootstrap
Installs ansible on your system, and continues the installation of all required packages.

# How to use

run the following from the command line:

```curl -s  https://raw.githubusercontent.com/alainchiasson/ansible-bootstrap/master/install.sh | bash -s ```

Changed to a playbook model - still need to work on it for a machine setup. Use the following command after ansible is installed. Still not sh

```ansible-playbook -i "localhost," -c local playbook.yml```
