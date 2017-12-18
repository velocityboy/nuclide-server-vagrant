#!/usr/bin/env bash

# Clone and build watchman

FBROOT=/opt/facebook
BUILDROOT=${FBROOT}/.build
WATCHMANROOT=${BUILDROOT}/watchman

if ! [ -d ${BUILDROOT} ] ; then
  mkdir -p ${BUILDROOT}
  if [ $? -ne 0 ] ; then
    echo Could not set up build root for Watchman
    exit 1
  fi
fi

if ! [ -d ${WATCHMANROOT} ] ; then
  git clone https://github.com/facebook/watchman.git ${WATCHMANROOT}
  if [ $? -ne 0 ] ; then
    echo Could not clone Watchman -- check your internet connection
    exit 1
  fi
fi

cd ${WATCHMANROOT}
if [ $? -ne 0 ] ; then
  echo Watchman root did not exist after clone
  exit 1
fi

git checkout v4.9.0
./autogen.sh
./configure --prefix=/usr/local
make -j 2

if [ $? -ne 0 ] ; then
  echo Failed to build Watchman
  exit 1
fi

make install
if [ $? -ne 0 ] ; then
  echo Failed to install Watchman
  exit 1
fi
