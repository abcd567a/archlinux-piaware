#!/bin/bash

DL_DIR=archlinux-piaware
INST_DIR=/usr/share/piaware-builder
USR=`whoami`
echo -e "\e[1;32mCreating dedicated folder \e[39m" ${INST_DIR} "\e[39m"
echo -e "\e[1;32mThis folder will hold cloned source-code and built package \e[39m"
sleep 2
sudo mkdir ${INST_DIR}
sudo chown ${USR} ${INST_DIR}

git clone https://github.com/abcd567a/${DL_DIR} ${INST_DIR}/${DL_DIR}

echo ""
echo -e "\e[1;32mInstalling packages to provide Build Tools and Dependencies \e[39m"
echo ""
sleep 2
sudo pacman --needed -S fakeroot git gcc make binutils pkgconf glibc which
sudo pacman --needed -S patch autoconf tcl tk openssl
sudo pacman --needed -S python python-setuptools python-pip net-tools
sudo pacman --needed -S python-build python-installer

echo ""
echo -e "\e[1;32mBuilding and Installing package tcllib \e[39m"
echo ""
sleep 2
cd ${INST_DIR}
git clone https://aur.archlinux.org/tcllib
cd tcllib
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing package tclx \e[39m"
echo ""
sleep 2
cd ${INST_DIR}
git clone https://aur.archlinux.org/tclx
cd tclx
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing package tcltls \e[39m"
echo ""
sleep 2
cd ${INST_DIR}
git clone https://aur.archlinux.org/tcltls
cd tcltls
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing packages tcllauncher \e[39m"
echo ""
sleep 2
cd ${INST_DIR}
git clone https://aur.archlinux.org/tcllauncher
cd tcllauncher
makepkg -si

echo ""
echo -e "\e[1;95mInstallation of Build Tools and Dependency packages completed \e[39m"
echo ""
echo -e "\e[1;32mNow Building package PIAWARE \e[39m"
echo ""
sleep 2
cd ${INST_DIR}/${DL_DIR}
makepkg -si

