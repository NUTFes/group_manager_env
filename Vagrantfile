# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "gm.local"
  config.vm.network :private_network, ip: "192.168.56.3"
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.provider :virtualbox do |vb|
    vb.name = "gm"
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  config.vm.provision :shell, :path => "general_setup.sh", privileged: true
  config.vm.provision :shell, :path => "rbenv.sh", privileged: false
  config.vm.provision :shell, :path => "rails_practice.sh", privileged: false
end
