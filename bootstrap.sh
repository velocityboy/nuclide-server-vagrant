#!/usr/bin/env bash

# Get needed dependencies
curl -sL https://deb.nodesource.com/setup_7.x | bash -
apt-get update
apt-get install -y git curl nodejs g++ autoconf automake libtool libssl-dev make pkg-config python python-dev

if [ $? -ne 0 ] ; then
  echo Failed to install dependencies via packagem manager
  exit 1
fi
