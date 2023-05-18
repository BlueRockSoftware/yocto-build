#!/bin/sh -l

source sources/poky/oe-init-build-env builds/rpi/brsaudio
bitbake $1
bitbake $1 -c populate_sdk