This Vagrant config sets up an Ubuntu 16.04 server with all the
dependencies needed to run a Nuclide server instance.

After bringing up the instance with 'vagrant up', do 'vagrant ssh-config'
to find the port and ssh private key to use in the Nuclide remote 
project dialog. The host will be localhost, or 127.0.0.1.
