#!/bin/sh -l

echo $GITHUB_WORKSPACE
echo $1 $2

orig_user=$(stat -c '%u' $GITHUB_WORKSPACE )
orig_group=$(stat -c '%g' $GITHUB_WORKSPACE )

echo "User ID " $orig_user
echo "Group ID " $orig_group

# set all files to the user yocto so we can run the build as this user.
chown -R yocto:yocto $GITHUB_WORKSPACE

# run build script at the yocto user (created in the Dockerfile)
sudo -i -u yocto /build.sh $1 $2 $GITHUB_WORKSPACE

find builds/rpi/brsaudio/tmp/deploy 

# set all files back to previous user
chown -R $orig_user:$orig_group $GITHUB_WORKSPACE
