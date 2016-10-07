#!/bin/bash

# copy redis files to each vm.
# in this file, we are going to use 4 vms.

PREFIX=vm;
NUM_OF_VMS=4;
IP_BASE="10.0.0."
IP_START=5;

echo "===> Copying redis files to each vm..."

./ssh-control/install-cp/copy.sh $PREFIX 0 $((NUM_OF_VMS-1)) redis_benchmark_sshcpy.conf

wait
echo "=====Finish copying!!!======"
echo "===> Start running redis server in each vm..."
./ssh-control/run_cmds.sh $PREFIX 0 $((NUM_OF_VMS-1)) "./redis-3.2.3/src/redis-server --protected-mode no" &

wait 

echo "=====Finish servers setup!!!====="

echo "===> Run redis benchmark on dom0..."



#  TODO:Figure out the ip configure...
./redis-3.2.3/src/redis-benchmark  -h $IP_BASE$IP_START > $PREFIX"0".csv &
./redis-3.2.3/src/redis-benchmark  -h $IP_BASE$((IP_START+1)) > $PREFIX"1".csv &
./redis-3.2.3/src/redis-benchmark  -h $IP_BASE$((IP_START+2)) > $PREFIX"2".csv &
./redis-3.2.3/src/redis-benchmark  -h $IP_BASE$((IP_START+3)) > $PREFIX"3".csv &

wait

echo "=====Finish benchmark, please check data files of different vms!!!====="

