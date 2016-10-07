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

```
./prepare.sh
```



## History

ver.10-07-2016: create this git repo


## TODO

1. IP configuration.

2. Average of results.

3. Standard deviation of results.




