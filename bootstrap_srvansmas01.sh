#!/bin/bash

# Install anisble engine
echo "Installing Ansible. Please wait.."
yum install -y epel-release > /dev/null 2>&1
yum install -y ansible >/dev/null 2>&1

# Ansible Config 
echo "Ansible setup is in progress. Please wait.."
useradd admin && echo "test@123" | passwd admin --stdin > /dev/null 2>&1
#su - admin -c "ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa 2>/dev/null <<< y >/dev/null"
mkdir /home/admin/ansible
cat >>/home/admin/ansible/inventory<<EOF
[dev]
srvansnod1
[prod]
srvansnod2
EOF
cat >>/home/admin/ansible/ansible.cfg<<EOF
[defaults]
inventory = ./inventory
host_key_checking = False
EOF
cat >> /home/admin/ansible/demo.yml<<EOF
---
- hosts: all
  remote_user: admin
  tasks:

  - name: My first playbook
    debug:
     msg: "Hello World!"
EOF
echo -e "admin\tALL=(ALL)\tNOPASSWD:\tALL" >> /etc/sudoers
chown -R admin:admin /home/admin/ansible
#su - admin -c "echo -e "test@123" | ssh-copy-id -i srvansnod1"
#su - admin -c "echo -e "test@123" | ssh-copy-id -i srvansnod2"
echo "Ansible setup completed successfully.."



