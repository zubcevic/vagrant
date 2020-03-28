#!/bin/bash
yum -y install yum-utils
find /var -name "*.log" \( \( -size +50M -mtime +7 \) -o -mtime +30 \) -exec truncate {} --size 0 \;
package-cleanup -y --oldkernels --count=1
package-cleanup --quiet --leaves | xargs yum remove -y
yum -y autoremove 
yum -y remove yum-utils zip unzip git
yum clean all
rm -rf /tmp/*
rm -rf /var/cache/yum
rm -rf /var/tmp/yum-*
rm -f /var/log/wtmp /var/log/btmp
#dd if=/dev/zero of=/EMPTY bs=4096
#rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c
cat /dev/null > /home/vagrant/.bash_history
