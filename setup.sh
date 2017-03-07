#!/bin/bash 

trap shutdown INT SIGTERM

shutdown() {

	if [ "$1" != 0 ] ; then 
		printf -- "\nExit $1: $2\n"
		
	fi
	printf -- "Thank you for using the vagrant setup tool\n"
	printf -- "Copyright (c) Zubcevic.com 2017\n"
	exit $1

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


checkdisksize() {
disksize=$(df -k -l --output=avail / |tail -n1)
if  [[ $disksize -lt 30000000 ]] ; then
	shutdown 1 "not more than 30GB free"
fi
}

checkcpusize() {
cpusize=$(cat /proc/cpuinfo | grep processor| wc -l)
if  [[ $cpusize -lt 5 ]] ; then
	shutdown 1 "not enough cpu"
fi
}

checkmemsize() {
memsize=$(cat /proc/meminfo | grep MemFree| awk '{print $2}' )
if  [[ $memsize -lt 4500000 ]] ; then
	shutdown 1 "not enough free memory"
fi
}

generatesshkey "github_rsa"

checkdisksize
checkcpusize
checkmemsize

curl https://www.eclipse.org/downloads/download.php?file=/oomph/epp/neon/R2a/eclipse-inst-linux64.tar.gz&r=1 -o downloads/eclipse.tar.gz

if vagrant status | grep -q 'not created' ; then
	vagrant plugin install vagrant-vbguest
	vagrant up
else 
	vagrant up
	vagrant provision
fi



