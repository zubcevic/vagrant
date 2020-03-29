# Vagrant image for OWASP Tools Training Workshop

# Making the image

+ Create a local admin account in Windows for the SMB share: vagrantlocal
+ After the initial provisioning, finnish the Desktop creation manually which will create the /home/vagrant/Desktop etc.
+ Continue the provisioning
+ Start all local desktop items
+ startgoat.sh and startjuice.sh and startcrs.sh locally one time
+ change firefox proxy settings
+ add certificates to firefox
+ remove screen lock and disable password prompt

# Export

+ vagrant package --output owasptraining.box

# Upload to cloud

+ vagrant cloud auth login
+ manually add hyperv provider and calculate sha256 hash of the box
+ vagrant cloud provider upload owaspwebgoat/training hyperv 20.0.0 owasptraining.box
