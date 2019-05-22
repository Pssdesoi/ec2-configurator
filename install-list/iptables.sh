#!/bin/bash
. my-cnf.sh

echo "Set up iptables"
sudo iptables -A PREROUTING -t nat -p tcp --dport 80 -j REDIRECT --to-ports 8080
sudo iptables -A PREROUTING -t nat -p tcp --dport 443 -j REDIRECT --to-ports 8443
