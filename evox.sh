#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/Evolution-X/manifest -b vic-qpr1 --git-lfs
echo "******************"
echo "******************"
echo "Repo init: done!"
echo "******************"
echo "******************"

# Clone local_manifests repository
git clone -b main https://github.com/bittencourtjulival/local_manifests.git .repo/local_manifests
echo "*****************************"
echo "*****************************"
echo "Local manifest clone: done"
echo "*****************************"
echo "*****************************"

# Sync the repositories
/opt/crave/resync.sh
echo "*****************************"
echo "*****************************"

# Export
export BUILD_USERNAME=bittencourtjulival
export BUILD_HOSTNAME=crave
export TZ="TZ=Asia/Dhaka"
echo "*****************************"
echo "Export: Done!"
echo "*****************************"

# Set up build environment
source build/envsetup.sh
echo "*****************************"

# Lunch
lunch lineage_stone-ap4a-userdebug
echo "*****************************"
# Make
m evolution
echo "*****************************"
