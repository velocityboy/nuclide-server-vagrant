#!/usr/bin/env bash

# The npm version of nuclide server is out of date, so build it from git

FBROOT=/opt/facebook
NUCLIDE_ROOT=${FBROOT}/nuclide
NUCLIDE_START_SERVER=${NUCLIDE_ROOT}/pkg/nuclide-server/nuclide-start-server
GIT_REPO=https://github.com/facebook/nuclide.git
STARTUP_SCRIPT_LINK=/usr/local/bin/nuclide-start-server

# Ensure the root directory exists
if ! [ -d ${FBROOT} ] ; then
  mkdir ${FBROOT}
fi

# Get the project
if ! [ -d ${NUCLIDE_ROOT} ] ; then
  git clone ${GIT_REPO} ${NUCLIDE_ROOT}
else
  cd ${NUCLIDE_ROOT}
  git pull
fi

# Install dependencies and transpile
cd ${NUCLIDE_ROOT}
yarn install
yarn release-transpile

# Put it in the path
if [ -e ${STARTUP_SCRIPT_LINK} ] ; then
  rm ${STARTUP_SCRIPT_LINK}
fi

ln -s ${NUCLIDE_START_SERVER} ${STARTUP_SCRIPT_LINK}
