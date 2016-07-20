#!/usr/bin/env bash

echo ">>> Installing MongoDB"

# Get key and add to sources
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

sudo echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Update
sudo apt-get update

sudo apt-get install -y --allow-unauthenticated mongodb-org

sed -i "s/bind_ip = .*/bind_ip = 0.0.0.0/" /etc/mongod.conf

sudo echo "[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target" >> /etc/systemd/system/mongodb.service

sudo systemctl start mongodb

sudo systemctl enable mongodb

sudo reboot
