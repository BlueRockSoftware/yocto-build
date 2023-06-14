#!/bin/bash

echo Yocto build $1 $2 $3 $4
env

# goto the build dir
cd $4

# configure the profile and run bitbake on the image
source $2 $3
bitbake $1
#bitbake $1 -c populate_sdk