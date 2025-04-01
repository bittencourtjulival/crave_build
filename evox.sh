#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/Evolution-X/manifest -b vic --git-lfs
echo "******************"
echo "******************"
echo "Repo init: done!"
echo "******************"
echo "******************"

# Modify update package.
rm -rf packages/apps/Updater
git clone https://github.com/bittencourtjulival/packages_apps_Updater.git -b vic packages/apps/Updater
echo "*******************************"
echo "Modified update package success"
echo "*******************************"
echo ""

# Clone local_manifests repository
git clone -b evox https://github.com/bittencourtjulival/local_manifests.git .repo/local_manifests
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

# Lunch
lunch lineage_stone-ap4a-userdebug
echo "*****************************"
# Make
m evolution
echo "*****************************"
