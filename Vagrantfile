
Vagrant.configure("2") do |config|

  config.vm.box = "boxcutter/centos72-desktop"

  config.vm.network "forwarded_port", guest: 9080, host: 9080


  #config.vm.synced_folder "/downloads", "/downloads"

  # Provider-specific configuration so you can fine-tune various
  config.vm.provider "virtualbox" do |vb|
	vb.name = "devbox_bluemix"
	vb.memory = "4096"
	vb.cpus = 2
   end
  
  config.vm.provision "shell", inline: <<-SHELL
     whoami
SHELL

   config.vm.provision "shell", path: "provision.sh", privileged: false

end
