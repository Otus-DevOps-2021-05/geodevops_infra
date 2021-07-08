#!/bin/bash
sudo apt-get install -y git
sleep 5s
git clone -b monolith https://github.com/express42/reddit.git
sleep 5s
cd reddit && bundle install
sleep 10s
puma -d
