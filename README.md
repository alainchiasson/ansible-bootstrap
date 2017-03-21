[![forthebadge](http://forthebadge.com/images/badges/fuck-it-ship-it.svg)](http://forthebadge.com)

# ansible-bootstrap
Installs ansible on your system, and continues the installation of all required packages.

# New changes

Try see if we can invert this - stuff ansible in a container, with the proper scripts, and docker run to deploy the local machine.

- First pass would be to deploy whatever is in the playbok
- Second pass is to have it be selective based on the machine tags/ name.

# How to use

Currently this is limited to a linux type host running an ssh
daemon. In this case this is the vagrant box. to use:

```
vagrant up
vagrant ssh -c 'sudo docker run -ti --rm \
    -v /root/.ssh:/root/.ssh \
    -v /vagrant:/ansible/playbooks \
    philm/ansible_playbook -i inventory playbook.yml'
```

In this case the vagrant file does a little extra magic. It will
install docker, create a key_pair, places it in athorized_keys
and will also populate the inventory file.

I still need to see if they would make sense in the case of a
remote host, or is this example way too contrived.

# Other items to think off

A testing loop using virtual box :

- Create an initial VM with Docker.
- Do a docker run of container under test
- run Inspec or Testinfra to validate

Place this in an automatable look like test kitchen.

- I cannot run this on an OSX host (to configure the OSX host)

# More development

In the description of the ```philm/ansible_playbook```, he talks
about using an ```ansible_target``` container as the endpoint
for running the ansible playbook against, mounting similar
volumes for keys exchange. Overall this seems like a simple
way of testing ansible roles without including the container
information - much like test-kitchen.

A future interaction, it may make sense to create deployer
containers for all orchestaration tolls as well as test containers
for  differing types of testing.

Could I create an internal audit container ?
Or would these just make sense for remote infrastructure ?

I need to follow through on scenarios and alternate methods
of deploying and testing.

BONUS : make a single image to also install windows.
