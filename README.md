# Redis on Xen

## Description

Redis on Xen is to run redis servers on several 
Xen guests and benchmark these server on dom0.
I am currently using the default parameters for
redis benchmark.


## Installation

The user should prepare Xen hypervisor, delpoy Xen vm(s), start them and 
download redis in dom0 before starting experiment. (After clone this repo
you will have a redis-3.2.3. The script will help you copy these redis 
files into each vm.)


## Usage

After delpoying the vms, the user can execute this to start the experiment.

```
./prepare.sh
```
After benchmarking finish, run this script will calculate the mean and the standard
deviation of SET and GET.

```
./calculate.sh
```
The final result will store in

```
result.csv
```

## History

ver.10-07-2016: create this git repo

ver.10-08-2016: finish calculation of average and standard deviation


## TODO

1. IP configuration for variable number of vm;

2. Can do user defined command of benchmark if necessary. 




