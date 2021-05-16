#!/bin/bash

wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.10/bee-clef_0.4.10_amd64.rpm && rpm -i bee-clef_0.4.10_amd64.rpm
wget https://github.com/ethersphere/bee/releases/download/v0.5.3/bee_0.5.3_amd64.rpm && rpm -i bee_0.5.3_amd64.rpm
systemctl stop bee
wget -O /etc/bee/bee.yaml https://raw.githubusercontent.com/YourBroDuke/bee-client-conf/master/bee.yaml
wget https://raw.githubusercontent.com/ethersphere/bee-clef/master/packaging/bee-clef-keys
chmod +x ./bee-clef-keys
./bee-clef-keys
wget -O cashout.sh https://gist.githubusercontent.com/ralph-pichler/3b5ccd7a5c5cd0500e6428752b37e975/raw/b40510f1172b96c21d6d20558ca1e70d26d625c4/cashout.sh

