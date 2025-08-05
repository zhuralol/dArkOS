#!/bin/bash

# Build and install ti99sim standalone emulator
if [ "$UNIT" == "rgb10" ]; then
  BUILD_UNIT="rgb10"
elif [ "$UNIT" == "rg351mp" ]; then
  BUILD_UNIT="rg351mp"
elif [ "$CHIPSET" == "rk3566" ]; then
  BUILD_UNIT="rg503"
fi
call_chroot "cd /home/ark &&
  cd ${CHIPSET}_core_builds &&
  git clone --recursive https://github.com/christianhaitian/ti99sim.git -b ${BUILD_UNIT} &&
  cd ti99sim && 
  sed -i '/cf7+.hpp\"/s//cf7+.hpp\"\n\#include <cstring>/' src/core/device-support.cpp &&
  eatmydata make -j$(nproc) &&
  strip bin/*
  "
sudo mkdir -p Arkbuild/opt/ti99sim/cartridges
sudo mkdir -p Arkbuild/opt/ti99sim/console
sudo mkdir -p Arkbuild/opt/ti99sim/disks
sudo cp -R Arkbuild/home/ark/${CHIPSET}_core_builds/ti99sim/bin/ Arkbuild/opt/ti99sim/
sudo cp ti99sim/ti99.sh Arkbuild/usr/local/bin/
sudo chmod 777 Arkbuild/opt/ti99sim/bin/*
sudo chmod 777 Arkbuild/usr/local/bin/ti99.sh
call_chroot "chown -R ark:ark /opt/"
