#! /bin/bash
sudo apt-get update
sudo mkdir /vyos
sudo wget http://packages.vyos.net/iso/release/1.1.7/vyos-1.1.7-amd64.iso /vyos
mkdir /rootfs
sudo mount -o loop /vyos/vyos-1.1.7-amd64.iso /rootfs
sudo apt-get install -y squashfs-tools
mkdir /unsquashfs
sudo unsquashfs -f -d /unsquashfs /rootfs/live/filesystem.squashfs
sudo tar -C /unsquashfs -c . | docker import – meidan/vyos
