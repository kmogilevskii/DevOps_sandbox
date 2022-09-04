#!/bin/bash
sudo apt update
sudo apt -y remove needrestart
sudo apt upgrade -y
sudo apt install memcached -y
sudo systemctl start memcached
sudo systemctl enable memcached
sudo systemctl status memcached
sudo memcached -p 11211 -U 11111 -u root -d