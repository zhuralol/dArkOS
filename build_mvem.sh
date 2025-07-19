#!/bin/bash

# Build and install mvem for various dArkOS menus from christianhaitian/mvem

call_chroot "cd /home/ark &&
  cd ${CHIPSET}_core_builds &&
  git clone --recursive --depth=1 https://github.com/christianhaitian/Paul-Robson-s-Microvision-Emulation.git &&
  cd Paul-Robson-s-Microvision-Emulation/ &&
  make -j$(nproc) &&
  strip mvem &&
  mkdir -p /opt/mvem &&
  cp *.bmp /opt/mvem/ &&
  cp mvem /opt/mvem/ &&
  chmod 777 /opt/mvem/mvem
  "

sudo cp -R mvem/controls/ Arkbuild/opt/mvem/
call_chroot "chown -R ark:ark /opt"
sudo cp mvem/scripts/mvem.sh Arkbuild/usr/local/bin/
sudo chmod 777 Arkbuild/usr/local/bin/mvem.sh
