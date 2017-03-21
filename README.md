[![forthebadge](http://forthebadge.com/images/badges/fuck-it-ship-it.svg)](http://forthebadge.com)

# ansible-bootstrap
Installs ansible on your system, and continues the installation of all required packages.

# New changes

Try see if we can invert this - stuff ansible in a container, with the proper scripts, and docker run to deploy the local machine.

- First pass would be to deploy whatever is in the playbok
- Second pass is to have it be selective based on the machine tags/ name.

# How to use

The new expeted use will be :

- Install docker
- docker run ansible-worstation-deployer

# Other items to think off

A testing loop using virtual box :

- Create an initial VM with Docker.
- Do a docker run of container under test
- run Inspec or Testinfra to validate

Place this in an automatable look like test kitchen.

BONUS : make a single image to also install windows.

# Depracated ---

# How to use

run the following from the command line:

```curl -s  https://raw.githubusercontent.com/alainchiasson/ansible-bootstrap/master/install.sh | bash -s ```

Changed to a playbook model - still need to work on it for a machine setup. Use the following command after ansible is installed. Still not sh

```ansible-playbook -i "localhost," -c local playbook.yml```
