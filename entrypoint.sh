#!/bin/sh -l

echo $GITHUB_WORKSPACE
echo $1

chown -R yocto:yocto $GITHUB_WORKSPACE


sudo -i -u yocto /build.sh $1 $GITHUB_WORKSPACE

ls -la

ls -la builds/rpi/brsaudio/tmp/deploy

find builds/rpi/brsaudio/tmp/deploy 