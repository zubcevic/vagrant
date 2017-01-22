#!/bin/bash 

trap shutdown INT SIGTERM

shutdown() {

	echo
	echo 'Thank you'
	exit 0

}

mkdir -p ~/.ssh
chmod 700 ~/.ssh
ls -la ~/.ssh/

generatesshkey() {
echo "generating $1 key for GitHub"
if [ ! -f ~/.ssh/$1 ] ; then 
	ssh-keygen -b 2048 -t rsa -Z aes-256-cbc -f ~/.ssh/$1 -N "password" > /dev/null 2>&1
else 
	echo "key $1 allready exists"
	cat ~/.ssh/$1.pub
fi
}

generatesshkey "github_rsa"

disksize=$(df -k -l --output=avail / |tail -n1)
if  [[ $disksize -lt 30000000 ]] ; then
	echo "not more than 30GB free"
fi

cpusize=$(cat /proc/cpuinfo | grep processor| wc -l)
if  [[ $cpusize -lt 5 ]] ; then
	echo "not enough cpu"
fi

memsize=$(cat /proc/meminfo | grep MemFree| awk '{print $2}' )
if  [[ $memsize -lt 4500000 ]] ; then
	echo "not enough free memory"
fi

echo $disksize
echo $cpusize
echo $memsize

if vagrant status | grep -q 'not created' ; then
	vagrant plugin install vagrant-vbguest
	vagrant up
else 
	vagrant up
	vagrant provision
fi



