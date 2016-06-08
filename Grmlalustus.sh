#!/bin/bash
yes | lvremove VG
yes | vgremove VG
yes | pvremove /dev/sda
yes | pvremove /dev/sda1
yes | pvremove /dev/sda2
yes | pvremove /dev/sda3
yes | pvremove /dev/sda4
yes | pvremove /dev/sda5
yes | pvremove /dev/sdb
yes | pvremove /dev/sdb1
