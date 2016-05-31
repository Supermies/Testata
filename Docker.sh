#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
mkdir /etc/apt
mkdir /etc/apt/sources.list.d
sudo touch /etc/apt/sources.list.d/docker.list
sudo cat > /etc/apt/sources.list.d/docker.list << EOF
deb https://apt.dockerproject.org/repo ubuntu-trusty main
EOF
sudo apt-get update
sudo apt-get purge lxc-dockery
sudo apt-cache policy docker-engine
sudo apt-get upgrade -y
sudo apt-get update
sudo apt-get install linux-image-extra-$(uname -r) -y
sudo apt-get update
sudo apt-get install docker-engine -y
sudo docker run -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.1 http://192.168.1.3:8080/v1/scripts/9B388C5EB4B89ED8DB61:1464685200000:ejjtDJzPm9BuRtQTh5q2dzsPKU
