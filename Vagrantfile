
Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"
  config.vm.box_version = "1905.1"

  config.vm.network "forwarded_port", guest: 9080, host: 9080
  #config.vm.synced_folder "/downloads", "/downloads"

  # Provider-specific configuration so you can fine-tune various
  config.vm.provider "virtualbox" do |vb|
	vb.name = "devbox_webgoat"
	vb.memory = "4096"
	vb.cpus = 2
   end
  
   config.vm.provision "shell", path: "provision.sh", privileged: false

end
