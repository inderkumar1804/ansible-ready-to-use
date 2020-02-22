#!/bin/bash

# Update hosts file
echo "Ansible config in progress.."
cat >>/etc/hosts<<EOF
172.40.40.200 srvansmas01.example.com srvansmas01
172.40.40.201 srvansnod1.example.com srvansnod1
172.40.40.202 srvansnod2.example.com srvansnod2
EOF


