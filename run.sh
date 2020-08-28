#! /usr/bin/env bash
my_ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
docker run --rm -it -p $my_ip:8888:8888 -v $1:/log -v $(realpath .):/jupyter --label RUN jupyter
