#!/bin/sh -l

echo $GITHUB_WORKSPACE
echo $1 $2 $3

orig_user=$(stat -c '%u' $GITHUB_WORKSPACE )
orig_group=$(stat -c '%g' $GITHUB_WORKSPACE )

echo "User ID " $orig_user
echo "Group ID " $orig_group

# set all files to the user yocto so we can run the build as this user.
chown -R yocto:yocto $GITHUB_WORKSPACE

# run build script at the yocto user (created in the Dockerfile)
sudo -i -u yocto /build.sh $1 $2 $3 $GITHUB_WORKSPACE
exit_status=$?

# set all files back to previous user
chown -R $orig_user:$orig_group $GITHUB_WORKSPACE

if [ $exit_status -eq 0 ]; then
    echo "Yocto build completed successfully"
    exit 0
else
    echo "Bitbake failed!"
    exit 1
fi
