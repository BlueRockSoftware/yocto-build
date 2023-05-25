#!/bin/bash

echo Yocto build $1 $2 $3
env

# goto the build dir
cd $3

# configure the profile and run bitbake on the image
source sources/poky/oe-init-build-env $2
bitbake $1
#bitbake $1 -c populate_sdk