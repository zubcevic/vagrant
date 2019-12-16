
sudo yum update -y

sudo hostname www.webgoat.local
sudo timedatectl set-timezone CET

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

