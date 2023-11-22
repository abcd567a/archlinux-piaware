#!/bin/bash
CLONED_FOLDER=${PWD}

sudo pacman --needed -Sy fakeroot binutils git pkgconf autoconf make gcc glibc patch which
sudo pacman --needed -Sy tcl python python-setuptools tk net-tools

cd ~/
git clone https://aur.archlinux.org/tcllib
cd tcllib
makepkg -si

cd ~/
git clone https://aur.archlinux.org/tclx
cd tclx
makepkg -si

cd ~/
git clone https://aur.archlinux.org/tcltls
cd tcltls
makepkg -si

cd ~/
git clone https://aur.archlinux.org/tcllauncher
cd tcllauncher
makepkg -si

cd ${CLONED_FOLDER}
makepkg -si



