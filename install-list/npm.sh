#!/bin/bash
. my-cnf.sh

# Installing NODE (Set npm)
if [[ ! -d $NODE_DIR ]]; then
	echo "Installing node $NODE_VERSION version"
	. ~/.nvm/nvm.sh
	. ~/.profile
	. ~/.bashrc
	# Verifying the NVM Version >> Installing Node >> Default setting
	nvm --version && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION
fi
