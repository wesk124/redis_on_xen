#!/bin/bash

# copy redis files to each vm.
# in this file, we are going to use 4 vms.

PREFIX=vm;
NUM_OF_VMS=4;

echo "===> Copying redis files to each vm..."

./ssh-control/install-cp/copy.sh $PREFIX 0 $((NUM_OFVMS-1)) redis_benchmark_sshcpy.conf

wait
echo "Finish copying!!!!"
echo "===> Start running redis server in each vm"
./ssh-control/run_cmds.sh $PREFIX 0 $((NUM_OFVMS-1)) "./redis-3.2.3/src/redis-server --protected-mode no" &

wait 

echo "Finish servers setup."

echo "===> Run redis benchmark on dom0..."


#  TODO:Figure out the ip configure...
./redis-3.2.3/src/redis-benchmark --csv -h 10.0.0.5 > $PREFIX"0".csv &
./redis-3.2.3/src/redis-benchmark --csv -h 10.0.0.6 > $PREFIX"1".csv &
./redis-3.2.3/src/redis-benchmark --csv -h 10.0.0.7 > $PREFIX"2".csv &
./redis-3.2.3/src/redis-benchmark --csv -h 10.0.0.8 > $PREFIX"3".csv &

wait

echo "benchmark finish, please check data files of different vms"

