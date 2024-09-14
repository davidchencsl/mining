export VERSION=3.0.3
pkill aleominer
rm -rf *aleo*
wget https://public-download-ase1.s3.ap-southeast-1.amazonaws.com/aleo-miner/aleominer+$VERSION.zip
apt install unzip
unzip -o aleominer+$VERSION.zip
rm -rf aleominer+$VERSION.zip
chmod +x /root/aleominer
echo -e "env >> /etc/environment;\ncurl -s https://raw.githubusercontent.com/davidchencsl/mining/main/start.sh | bash;" > onstart.sh
nohup bash -c "while true; do /root/aleominer -u stratum+tcp://aleo-asia.f2pool.com:4400 -w davidchencsl.$(hostname); done;" > /root/aleo.log 2>&1 &
