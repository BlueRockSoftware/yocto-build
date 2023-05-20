#!/bin/bash

echo Yocto build $1 $2

echo $HOME
echo This is tilde
ls -la ~
echo this is HOME
ls -la $HOME

env

cd $2

ls -la

source sources/poky/oe-init-build-env builds/rpi/brsaudio
bitbake $1
bitbake $1 -c populate_sdk