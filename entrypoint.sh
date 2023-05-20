#!/bin/sh -l

echo $GITHUB_WORKSPACE
echo $(pwd)
ls -la

chown -R yocto:yocto $GITHUB_WORKSPACE

ls -la /

sudo -u yocto /build.sh $1
