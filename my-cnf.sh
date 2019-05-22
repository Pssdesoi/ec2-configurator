#!/bin/bash

NODE_VERSION="v8.16.0"
NVMDIR=~/.nvm
NVM=~/.nvm/nvm.sh
NODE_DIR=$NVMDIR/versions/node/$NODE_VERSION
PM2_PATH=$NODE_DIR/bin/pm2
MONGO_FILE=/etc/mongod.conf
