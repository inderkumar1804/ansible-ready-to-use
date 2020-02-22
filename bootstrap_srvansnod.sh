#!/bin/bash

# Update hosts file
echo "Ansible node setup is in progress.."
useradd admin && echo "test@123" | passwd admin --stdin > /dev/null 2>&1
echo -e "admin\tALL=(ALL)\tNOPASSWD:\tALL" >> /etc/sudoers
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

