#!/bin/bash

# copy redis files to each vm.
# in this file, we are going to use 4 vms.

source pv-deploy-config.mk
NUM_OF_VMS=$VM_NUM;
IP_BASE=`echo $GATEWAY | cut -d"." -f1-3`.
IP_START=$BASE_IP_NUM;


# Install redis file in each vm
echo "===> Copying redis files to each vm..."

./ssh-control/install-cp/copy.sh $PREFIX 0 $((NUM_OF_VMS-1)) redis_benchmark_sshcpy.conf

wait
echo "=====Finish copying!!!======"

# Strat redis server
echo "===> Start running redis server in each vm..."
./ssh-control/run_cmds.sh $PREFIX 0 $((NUM_OF_VMS-1)) "./redis-3.2.3/src/redis-server --protected-mode no" &

wait 

echo "=====Finish servers setup!!!====="

#echo "===> Run redis benchmark on dom0..."

#for i in `seq 0 $((NUM_OF_VMS-1))`; do
#./redis-3.2.3/src/redis-benchmark -t set,get --csv -h $IP_BASE$((IP_START+$i)) > $PREFIX"$i".csv &
#done

#wait

#echo "=====Finish benchmark, please check data files of different vms!!!====="

