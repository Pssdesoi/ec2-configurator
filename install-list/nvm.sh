#!/bin/bash
. my-cnf.sh

# Installing NVM
if [[ ! -d $NVMDIR ]]; then
	echo "NVM is not installed yet."
	echo "Start the NVM installation."
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
fi
