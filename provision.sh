
sudo yum update -y

sudo hostname www.webgoat.local
sudo timedatectl set-timezone CET

sudo yum -y install zip unzip wget git
sudo yum -y groups install "GNOME Desktop"
sudo systemctl set-default graphical.target
sudo systemctl isolate graphical.target

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

# INSTALLATION OF OWASP ZAP
if [! -f zap.tar.gz]
then
wget https://github.com/zaproxy/zaproxy/releases/download/v2.8.1/ZAP_2.8.1_Linux.tar.gz -O zap.tar.gz
tar -xf zap.tar.gz
fi

# INSTALLATION OF JAVA11
if [! -f jre11.tar.gz]
then
wget https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.5%2B10/OpenJDK11U-jre_x64_linux_hotspot_11.0.5_10.tar.gz -O jre11.tar.gz
tar -xf jre11.tar.gz
echo "export PATH=$PWD/jdk-11.0.5+10-jre/bin:$PATH" >> .bash_profile
fi

# INSTALLATION OF FIREFOX
wget https://download.mozilla.org/?product=firefox-latest-ssl\&os=linux64 -O firefox.tar.bz2
tar -xf firefox.tar.bz2

# RUN OWASP WebGoat and WebWolf
docker run -d -p 8080:8080 -p 9090:9090 -p 80:80 -e TZ=Europe/Amsterdam -name webgoat webgoat/goatandwolf

# RUN OWASP CRS ModSecurity
docker run -dti \
--name apachecrsrp \
--env PARANOIA=1 \
--env ANOMALYIN=5 \
--env ANOMALYOUT=5 \
--env ALLOWED_METHODS="GET POST" \
--env MAX_FILE_SIZE=5242880 \
--env RESTRICTED_EXTENSIONS=".conf/" \
--env PORT=8001 \
--publish 8001:8001 \
--env BACKEND=http://10.56.14.8:8080 \
franbuehler/modsecurity-crs-rp
