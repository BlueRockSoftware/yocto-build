#!/bin/sh -l

echo $GITHUB_WORKSPACE
echo $(pwd)
ls -la

chown -R yocto:yocto $GITHUB_WORKSPACE

ls -la /

sudo -i -u yocto /build.sh $1 $GITHUB_WORKSPACE
