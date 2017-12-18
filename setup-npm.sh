#!/usr/bin/env bash

# make it so npm -g can be run as the default user
if ! [ -e /usr/local/lib/node_modules ] ; then 
  mkdir /usr/local/lib/node_modules
fi

chown ubuntu -R /usr/local/{lib/node_modules,bin,share}
sudo -i -u ubuntu npm set prefix /usr/local

npm install -g yarn
