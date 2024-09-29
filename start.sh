#!/bin/bash

set -x

VERSION=v0.2.3_lite
ADDRESS=aleo13q6dkky4re5r29ejm63cyjh7g7fwtyfczzpcu8004jjwfu6ayu8q2jt2ef
RELEASE=$(cut -d'_' -f1 <<< $VERSION)
wget https://github.com/6block/zkwork_aleo_gpu_worker/releases/download/$RELEASE/aleo_prover-$VERSION.tar.gz
tar -zxvf aleo_prover-$VERSION.tar.gz
rm -rf aleo_prover-$VERSION.tar.gz
chmod +x aleo_prover/aleo_prover
cd aleo_prover
while
do 
  ./aleo_prover --pool aleo.asia1.zk.work:10003 --pool aleo.hk.zk.work:10003 --pool aleo.jp.zk.work:10003 --address $ADDRESS --custom_name $(hostname)
done                      
