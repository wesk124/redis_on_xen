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

After delpoying the vms, the user can execute this to copy redis files and 
start redis server in each vm.

```
./prepare.sh
```
Start benchmarking

```
./launch.sh
```

## History

ver.10-07-2016: create this git repo

ver.10-08-2016: finish calculation of average and standard deviation

ver. 10-17-2016: finish iteration of experiment

ver. 10-19-2016: almost done...


## TODO






