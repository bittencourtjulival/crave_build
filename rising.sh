#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/RisingOS-Revived/android -b fifteen --git-lfs
echo "******************"
echo "******************"
echo "Repo init: done!"
echo "******************"
echo "******************"

rm -rf hardware/xiaomi
echo "*******************************"
echo "Modified update package success"
echo "*******************************"
echo ""

# Clone local_manifests repository
git clone -b rising https://github.com/bittencourtjulival/local_manifests.git .repo/local_manifests
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
export TZ="America/Sao_Paulo"
echo "*****************************"
echo "Export: Done!"
echo "*****************************"

# Set up build environment
source build/envsetup.sh
echo "*****************************"

# Build
riseup stone userdebug
rise b
echo "*****************************"
