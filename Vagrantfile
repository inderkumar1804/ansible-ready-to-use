# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "bootstrap.sh"

  # Ansible Master Server
  config.vm.define "srvansmas01" do |srvansmas01|
    srvansmas01.vm.box = "centos/7"
    srvansmas01.vm.hostname = "srvansmas01.example.com"
    srvansmas01.vm.network "private_network", ip: "172.40.40.200"
    srvansmas01.vm.provider "virtualbox" do |v|
      v.name = "srvansmas01"
      v.memory = 1024
      v.cpus = 1
      # Prevent VirtualBox from interfering with host audio stack
      v.customize ["modifyvm", :id, "--audio", "none"]
    end
    srvansmas01.vm.provision "shell", path: "bootstrap_srvansmas01.sh"
  end

  NodeCount = 2

  # Ansible Nodes
  (1..NodeCount).each do |i|
    config.vm.define "srvansnod#{i}" do |ansiblenode|
      ansiblenode.vm.box = "centos/7"
      ansiblenode.vm.hostname = "srvansnod#{i}.example.com"
      ansiblenode.vm.network "private_network", ip: "172.40.40.20#{i}"
      ansiblenode.vm.provider "virtualbox" do |v|
        v.name = "srvansnod#{i}"
        v.memory = 800
        v.cpus = 1
        # Prevent VirtualBox from interfering with host audio stack
        v.customize ["modifyvm", :id, "--audio", "none"]
      end
      ansiblenode.vm.provision "shell", path: "bootstrap_srvansnod.sh"
    end
  end

end
