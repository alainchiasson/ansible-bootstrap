# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", type: "dhcp"

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
  #

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    yum install -y yum-utils
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    # yum-config-manager --enable docker-ce-edge
    yum makecache fast
    yum install -y docker-ce
    systemctl start docker
    # generate docker keys to loopback
    ssh-keygen -f /root/.ssh/id_rsa -q -N ""
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
    # Create the inventory file
    ip a show eth0 | grep 'inet ' | cut -d/ -f1 | awk '{print $2}' | tee /vagrant/inventory
    docker run --rm hello-world
  SHELL
end

# Getting into the container to test
# sudo docker run -ti --rm -v /root/.ssh:/root/.ssh -v /vagrant:/ansible/playbooks --entrypoint /bin/sh philm/ansible_playbook
# Running the playbook :
# sudo docker run -ti --rm -v /root/.ssh:/root/.ssh -v /vagrant:/ansible/playbooks philm/ansible_playbook playbook.yml
