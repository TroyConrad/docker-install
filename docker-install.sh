#!/bin/sh

apt-get update
apt-get install -y --install-recommends linux-generic-lts-vivid
apt-get install -y apt-transport-https ca-certificates

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

SOURCES_FILE=/etc/apt/sources.list.d/docker.list
rm -f $SOURCES_FILE
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > $SOURCES_FILE

apt-get update
apt-get purge lxc-docker

#apt-cache policy docker-engine

apt-get install -y docker-engine

source /etc/bash_completion.d/docker

docker -v
