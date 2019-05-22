#!/bin/bash
. ./my-cnf.sh

# Installing PM2
if [[ ! -e $PM2_PATH ]]; then
	echo "Installing pm2"
	nvm use $NODE_VERSION
	npm install pm2 -g
fi
