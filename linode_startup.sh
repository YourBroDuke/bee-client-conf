#!/bin/bash

yum install wget -y
yum install git -y

wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.10/bee-clef_0.4.10_amd64.rpm && rpm -i bee-clef_0.4.10_amd64.rpm
wget https://github.com/ethersphere/bee/releases/download/v0.5.3/bee_0.5.3_amd64.rpm && rpm -i bee_0.5.3_amd64.rpm
systemctl stop bee
wget -O /etc/bee/bee.yaml https://raw.githubusercontent.com/YourBroDuke/bee-client-conf/master/bee.yaml
wget https://raw.githubusercontent.com/ethersphere/bee-clef/master/packaging/bee-clef-keys
chmod +x ./bee-clef-keys
./bee-clef-keys
wget -O cashout.sh https://gist.githubusercontent.com/ralph-pichler/3b5ccd7a5c5cd0500e6428752b37e975/raw/b40510f1172b96c21d6d20558ca1e70d26d625c4/cashout.sh
chmod +x cashout.sh
wget https://github.com/YourBroDuke/bee-client-conf/raw/master/check.sh
chmod +x check.sh


yum install epel-release -y
yum install jq -y
yum install screen -y

# install golang
wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version

git clone https://github.com/YourBroDuke/bee.git
