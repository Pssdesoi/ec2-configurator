#!/bin/bash

# Installation order nvm > npm > pm2 > iptables > mongoDB
. ./nvm.sh && . ./npm.sh && . ./pm2.sh && . ./iptables.sh && . ./mongoDB.sh
