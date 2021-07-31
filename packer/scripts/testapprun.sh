#!/bin/bash
apt update
sleep 10s
apt-get install -y git
sleep 10s
git clone -b monolith https://github.com/express42/reddit.git
sleep 10s
cd reddit && bundle install
