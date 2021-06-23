#!/bin/bash
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
sleep 5s
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sleep 10s
sudo apt-get update
sleep 5s
sudo apt-get install -y mongodb-org
sleep 10s
sudo systemctl start mongod
sleep 5s
sudo systemctl enable mongod
