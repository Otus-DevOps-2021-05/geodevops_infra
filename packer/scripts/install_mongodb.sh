#!/bin/bash
apt-get install gnupg
sleep 10s
apt-get install -y apt-transport-https
sleep 10s
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
sleep 5s
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sleep 10s
apt-get update
sleep 5s
apt-get install -y mongodb-org
sleep 10s
systemctl start mongod
sleep 5s
systemctl enable mongod
