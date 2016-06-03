#!/bin/bash
yes | lvremove VG
yes | vgremove VG
pvcreate /dev/sda 
vgcreate VG /dev/sda
pvcreate /dev/sda1 
vgcreate VG /dev/sda1
vgextend VG /dev/sda1
pvcreate /dev/sda2 
vgcreate VG /dev/sda2
vgextend VG /dev/sda2
pvcreate /dev/sda3 
vgcreate VG /dev/sda3
vgextend VG /dev/sda3
pvcreate /dev/sda4 
vgcreate VG /dev/sda4
vgextend VG /dev/sda4
pvcreate /dev/sda5 
vgcreate VG /dev/sda5
vgextend VG /dev/sda5
pvcreate /dev/sdb 
vgcreate VG /dev/sdb
vgextend VG /dev/sdb
pvcreate /dev/sdb1
vgcreate VG /dev/sdb1
vgextend VG /dev/sdb1
pvcreate /dev/sdb2
vgcreate VG /dev/sdb2
vgextend VG /dev/sdb2
pvcreate /dev/sdb3 
vgcreate VG /dev/sdb3
vgextend VG /dev/sdb3
pvcreate /dev/sdb4 
vgcreate VG /dev/sdb4
vgextend VG /dev/sdb4
yes | lvcreate -l 100%FREE -n levy VG 
yes | mkfs.ext3 /dev/VG/levy 
mkdir /kansio
mount /dev/VG/levy /kansio
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
mkdir /etc/apt
mkdir /etc/apt/sources.list.d
sudo touch /etc/apt/sources.list.d/docker.list
sudo cat > /etc/apt/sources.list.d/docker.list << EOF
deb https://apt.dockerproject.org/repo ubuntu-trusty main
deb https://apt.dockerproject.org/repo debian-jessie main
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

