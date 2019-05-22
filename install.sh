#!/bin/bash

# Input form example
# echo "Input node version : "
# read NODE_VERSION
# echo $NODE_VERSION

NODE_VERSION="v8.16.0"
NVMDIR=~/.nvm
NVM=~/.nvm/nvm.sh
NODE_DIR=$NVMDIR/versions/node/$NODE_VERSION
PM2_PATH=$NODE_DIR/bin/pm2
MONGO_FILE=/etc/mongod.conf

# Installing NVM
if [[ ! -d $NVMDIR ]]; then
    echo "NVM is not installed yet."
    echo "Start the NVM installation."
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
fi

# Installing NODE (Set npm)
if [[ ! -d $NODE_DIR ]]; then
        echo "Installing node $NODE_VERSION version"
        . ~/.nvm/nvm.sh
        . ~/.profile
        . ~/.bashrc
        # Verifying the NVM Version >> Installing Node >> Default setting
        nvm --version && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION
fi

# Installing PM2
if [[ ! -e $PM2_PATH ]]; then
        echo "Installing pm2"
        nvm use $NODE_VERSION
        npm install pm2 -g
fi

echo "Set up iptables"
sudo iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT --to-ports 8080
sudo iptables -A PREROUTING -t nat -p tcp --dport 443 -j REDIRECT --to-ports 8443

if [[ ! -d $MONGO_FILE ]]; then
    echo "Installing MongoDB"
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
    echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    sudo service mongod start
fi
