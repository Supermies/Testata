#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo mkdir /etc/apt
sudo mkdir /etc/apt/sources.list.d
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
sudo usermod -aG docker root
sudo usermod -aG docker asd
touch /etc/init.d/myscript.sh
sudo cat > /etc/init.d/myscript.sh << EOF
sudo docker run -d --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/rancher:/var/lib/rancher rancher/agent:v1.0.1 http://192.168.1.3:8080/v1/scripts/8FD1B57205383841D6C6:1465902000000:K7K3C5C5hUHt4yeP3PIO79ELsc
EOF
sudo chmod +x /etc/init.d/myscript.sh
sudo update-rc.d myscript.sh defaults
sudo touch /var/spool/cron/crontabs/croni
sudo touch /var/croni.sh
sudo cat > /var/croni.sh << EOF
#!/bin/sh

ping -c5 192.168.1.1

if [ $? -eq 0 ]; then
    echo "ok"
else
    reboot
fi
EOF
sudo cat > /var/spool/cron/crontabs/croni << EOF
*/1 * * * * /usr/bin/somedirectory/somecommand
EOF
