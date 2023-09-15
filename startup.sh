#!/bin/bash

#General
apt-get update
apt-get install -y wget software-properties-common python3-full python3-launchpadlib git python3-pip libgbm-dev
add-apt-repository -y ppa:openjdk-r/ppa

#Neo4j
wget -O - https://debian.neo4j.com/neotechnology.gpg.key | apt-key add -
echo 'deb https://debian.neo4j.com stable latest' | tee -a /etc/apt/sources.list.d/neo4j.list
apt-get update
apt-get install -y neo4j=1:5.11.0
sed -i 's/#server.default_listen_address/server.default_listen_address/g' /etc/neo4j/neo4j.conf

#NodeJs
wget -O install.sh https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh
chmod 755 install.sh
wget https://github.com/zeronetworks/BlueHound/archive/refs/tags/v1.1.3.tar.gz
tar -xzvf v1.1.3.tar.gz
cd BlueHound-1.1.3
chown -R $BH_USER:$BH_USER /bluehound/BlueHound-1.1.3
sed -ri "s/(\"node_modules\/linkurious\")/  \"overrides\": { \"electron-webpack\": { \"webpack\": \"^5.67.0\" }},\n  \1/" package.json
chsh -s /bin/bash $BH_USER
export NVM_DIR="/home/$BH_USER/.nvm"
export HOME="/home/$BH_USER"
runuser -p $BH_USER -c '/bluehound/install.sh; \. "$NVM_DIR/nvm.sh";\
source /etc/environment; nvm install 17.4.0; cd /bluehound/BlueHound-1.1.3;\
npm install --peer-legacy-deps;
npm install @mui/x-date-pickers webpack-dev-server webpack-cli --peer-legacy-deps;'

#Import
git clone https://github.com/fox-it/bloodhound-import.git
cd bloodhound-import
python3 -m venv env
source env/bin/activate
python3 setup.py install
pip3 install -r requirements.txt

