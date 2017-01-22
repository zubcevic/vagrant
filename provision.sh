
sudo yum update -y

if [ ! -d /home/vagrant/wlp ] ; then 
	unzip /vagrant/downloads/wlp*.zip
fi

if [ ! -d /home/vagrant/soap ] ; then 
	tar xzvf /vagrant/downloads/SoapUI*.tar.gz
	mv /home/vagrant/Soap* /home/vagrant/soap
fi

if [ ! -d /home/vagrant/maven ] ; then 
	tar xzvf /vagrant/downloads/apache-maven*.tar.gz
	mv /home/vagrant/apache-maven* /home/vagrant/maven
fi

if [ ! -d /home/vagrant/eclipse ] ; then 
	tar xzvf /vagrant/downloads/eclipse*.tar.gz
fi

#cat << EOF > Bureaublad/eclipse.desktop
#[Desktop Entry]
#Version=1.0
#Name=Eclipse JDK 1.8
#Comment=Eclipse
#Exec=/home/vagrant/eclipse/eclipse
#Icon=/home/vagrant/eclipse/icon.xpm
#Terminal=false
#Type=Application
#Categories=Utility;Application;
#EOF


#ln -s /home/vagrant/eclipse/eclipse Bureaublad/eclipse