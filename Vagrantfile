# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_version = "20171212.0.0"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision :shell, path: "setup-npm.sh"
  config.vm.provision :shell, path: "build-watchman.sh" #, privileged: false
  config.vm.provision :shell, path: "nuclide-server.sh"

  config.vm.network :forwarded_port, guest: 9090, host: 9090
end
