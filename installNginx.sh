#!/bin/bash

#sleep until the instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
    sleep 1
done
apt-get update 
apt install nginx -y 
systemctl start nginx


