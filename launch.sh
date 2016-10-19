#!/bin/bash



source pv-deploy-config.mk
NUM_OF_VMS=$VM_NUM;
IP_BASE=`echo $GATEWAY | cut -d"." -f1-3`.
IP_START=$BASE_IP_NUM;

function run_benchmark {
	printf "please enter how many server you want for this run:\n";
	read num_of_servers;
	if [ $num_of_servers -gt $NUM_OF_VMS ]; then
		echo "number of servers cannot be greater than number of vm."
		exit
	fi
	printf "Running $num_of_servers server(s) benchmark will start in 3 secs...\n"
	sleep 3;
	mkdir "data"$((num_of_servers-1))
	for i in `seq 0 $((num_of_servers-1))`; do
		./redis-3.2.3/src/redis-benchmark -t set,get --csv -h $IP_BASE$((IP_START+$i)) > `pwd`'/'data$((num_of_servers-1))'/'$PREFIX"$i".csv &
	done
	wait
	printf "this set of experiment finish...\n"
	printf "calculate result...\n"
	./calculate.sh $((num_of_servers-1))
}



echo "start experiment..."
rm -r data*
rm result*.csv
wait
echo "clean old data..."

while true ;
do
	read -p "Continue experiement? (y/n)" answer
		case ${answer:0:1} in 
		y|Y )
			echo Yes;
			run_benchmark;;
		* )
			echo No;
			break;;
		esac

done


