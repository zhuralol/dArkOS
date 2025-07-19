#!/bin/bash

# Build and install piemu standalone emulator along with sdl2-compat
call_chroot "cd /home/ark &&
  cd ${CHIPSET}_core_builds &&
  chmod 777 builds-alt.sh &&
  eatmydata ./builds-alt.sh piemusa
  "
sudo mkdir -p Arkbuild/opt/piemu
sudo cp -a Arkbuild/home/ark/${CHIPSET}_core_builds/piemusa64/* Arkbuild/opt/piemu/
sudo cp piemu/scripts/piemu_run.sh Arkbuild/usr/local/bin/
call_chroot "chown -R ark:ark /opt/"
sudo chmod 777 Arkbuild/opt/piemu/*
sudo chmod 777 Arkbuild/usr/local/bin/piemu_run.sh