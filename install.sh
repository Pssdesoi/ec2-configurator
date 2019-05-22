#!/bin/bash

# Installation order nvm > npm > pm2 > iptables > mongoDB
. install-list/nvm.sh \
&& . install-list/npm.sh \
&& . install-list/pm2.sh \
&& . install-list/iptables.sh \
&& . install-list/mongoDB.sh
