#!/bin/bash
BUILD_FOLDER=/tmp/piaware-builder
sudo pacman --needed -Sy fakeroot binutils git pkgconf autoconf make gcc glibc patch which
sudo pacman --needed -Sy tcl python python-setuptools python-pip tk net-tools

cd ${BUILD_FOLDER}
git clone https://aur.archlinux.org/tcllib
cd tcllib
makepkg -si

cd ${BUILD_FOLDER}
git clone https://aur.archlinux.org/tclx
cd tclx
makepkg -si

cd ${BUILD_FOLDER}
git clone https://aur.archlinux.org/tcltls
cd tcltls
makepkg -si

cd ${BUILD_FOLDER}
git clone https://aur.archlinux.org/tcllauncher
cd tcllauncher
makepkg -si

cd ${BUILD_FOLDER}/archlinux-piaware
makepkg -si



