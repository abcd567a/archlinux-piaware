#!/bin/bash

echo ""
echo -e "\e[1;32mInstalling pacckages to provide Build Tools and Dependencies \e[39m"
echo ""
sleep 1
BUILD_FOLDER=${PWD}
sudo pacman --needed -S fakeroot git gcc make binutils pkgconf glibc which
sudo pacman --needed -S patch autoconf tcl tk openssl
sudo pacman --needed -S python python-setuptools python-pip net-tools
sudo pacman --needed -S python-build python-installer  

echo ""
echo -e "\e[1;32mBuilding and Installing package tcllib \e[39m"
echo ""
sleep 1
cd ${BUILD_FOLDER}
git clone https://aur.archlinux.org/tcllib
cd tcllib
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing package tclx \e[39m"
echo ""
sleep 1
cd ${BUILD_FOLDER}
git clone https://aur.archlinux.org/tclx
cd tclx
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing package tcltls \e[39m"
echo ""
sleep 1
cd ${BUILD_FOLDER}
git clone https://aur.archlinux.org/tcltls
cd tcltls
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing packages tcllauncher \e[39m"
echo ""
sleep 1
cd ${BUILD_FOLDER}
git clone https://aur.archlinux.org/tcllauncher
cd tcllauncher
makepkg -si

echo ""
echo -e "\e[1;95mInstallation of Build Tools and Dependency packages completed \e[39m"
echo ""
echo -e "\e[1;32mNow Building and Installing package PIAWARE \e[39m"
echo ""
sleep 2
cd ${BUILD_FOLDER}/archlinux-piaware
makepkg -si


