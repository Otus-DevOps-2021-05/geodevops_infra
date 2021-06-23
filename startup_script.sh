#!/bin/bash

#Install Ruby & bundle
sudo apt update
sleep 10s
sudo apt install -y ruby-full ruby-bundler build-essential
sleep 5s

#Install Mongodb
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
sleep 5s
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sleep 10s
sudo apt-get update
sleep 5s
sudo apt-get install -y mongodb-org
sleep 5s
sudo systemctl start mongod
sleep 5s
sudo systemctl enable mongod
sleep 5s

#Deploy puma APP
sudo apt-get install -y git
sleep 5s
git clone -b monolith https://github.com/express42/reddit.git
sleep 5s
cd reddit && bundle install
sleep 10s
puma -d
