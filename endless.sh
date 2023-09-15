#!/bin/bash

source ~/.bashrc
neo4j-admin dbms set-initial-password $NEO4J_PASS
neo4j start
cd BlueHound-1.1.3
export NVM_DIR="/home/$BH_USER/.nvm"
export HOME="/home/$BH_USER"
runuser -p $BH_USER -c ' \. "$NVM_DIR/nvm.sh"; nvm install 17.4.0; npm run dev'
