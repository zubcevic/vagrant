#!/bin/bash

if [ ! -f /usr/bin/docker ]
then

	sudo yum update -y
	sudo hostname www.webgoat.local
	sudo timedatectl set-timezone CET
	sudo yum -y install zip unzip wget git
	sudo yum -y groups install "GNOME Desktop"
	sudo systemctl set-default graphical.target
	sudo systemctl isolate graphical.target
fi

if [ ! -f /usr/bin/docker ]
then
	sudo yum install -y yum-utils \
		device-mapper-persistent-data \
		lvm2
	sudo yum-config-manager \
		--add-repo \
		https://download.docker.com/linux/centos/docker-ce.repo
	sudo yum -y install docker-ce docker-ce-cli containerd.io
	sudo usermod -aG docker vagrant
	sudo systemctl enable docker
	sudo systemctl start docker
fi

# INSTALLATION OF OWASP ZAP
if [ ! -f zap.tar.gz ]
then
	wget https://github.com/zaproxy/zaproxy/releases/download/v2.9.0/ZAP_2.9.0_Linux.tar.gz -O zap.tar.gz
	tar -xf zap.tar.gz
	mv ZAP_2.9.0 ZAP
fi

# INSTALLATION OF JAVA11
if [ ! -f jre11.tar.gz ]
then
	wget https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.5%2B10/OpenJDK11U-jre_x64_linux_hotspot_11.0.5_10.tar.gz -O jre11.tar.gz
	tar -xf jre11.tar.gz
	echo "export PATH=$PWD/jdk-11.0.5+10-jre/bin:$PATH" >> .bash_profile
fi

# INSTALLATION OF FIREFOX
#if [! -f firefox.tar.bz2]
#then
#wget https://download.mozilla.org/?product=firefox-latest-ssl\&os=linux64 -O firefox.tar.bz2
#tar -xf firefox.tar.bz2
#fi

# INSTALLATION OF BURP
if [ ! -f burpsuite.jar ]
then
	wget https://portswigger.net/burp/releases/download?product=community\&version=2020.2.1\&type=Jar -O burpsuite.jar
fi

if [ ! -f startgoat.sh ]
then
	cp /downloads/assets/* /home/vagrant
	mv /home/vagrant/*.desktop /home/vagrant/Desktop
fi


