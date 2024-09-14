#!/bin/bash

export VERSION=3.0.3
pkill aleominer
rm -rf *aleo*
wget https://public-download-ase1.s3.ap-southeast-1.amazonaws.com/aleo-miner/aleominer+$VERSION.zip
apt install unzip
unzip -o aleominer+$VERSION.zip
rm -rf aleominer+$VERSION.zip
chmod +x /root/aleominer
echo -e "env >> /etc/environment;\nrm -rf start.sh && wget https://raw.githubusercontent.com/davidchencsl/mining/main/start.sh && chmod +x start.sh && nohup ./start.sh > /root/aleo.log 2>&1 &" > onstart.sh
while true
do 
  /root/aleominer -u stratum+tcp://aleo-asia.f2pool.com:4400 -w davidchencsl.$(hostname)
done                      
