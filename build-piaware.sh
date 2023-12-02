#!/bin/bash

BUILD_FOLDER=${PWD}
echo ""
echo -e "\e[1;32mInstalling (if not already installed) following Build Tools \e[39m"
echo -e "\e[1;32m   git fakeroot patch gcc make autoconf \e[39m"
sleep 3
sudo pacman --needed -S git fakeroot patch gcc make autoconf
echo ""
echo -e "\e[1;95mBuilding and Installing following packages \e[39m"
echo -e "\e[1;95mwhich are NOT available in Arch Linux repo \e[39m"
echo -e "\e[1;95m  tcllib tclx tcltls tcllauncher \e[39m"
echo ""
echo -e "\e[1;32mBuilding and Installing package tcllib \e[39m"
echo ""
sleep 2
cd ${BUILD_FOLDER}
git clone https://aur.archlinux.org/tcllib
cd tcllib
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing package tclx \e[39m"
echo ""
sleep 2
cd ${BUILD_FOLDER}
git clone https://aur.archlinux.org/tclx
cd tclx
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing package tcltls \e[39m"
echo ""
sleep 2
cd ${BUILD_FOLDER}
git clone https://aur.archlinux.org/tcltls
cd tcltls
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing packages tcllauncher \e[39m"
echo ""
sleep 2
cd ${BUILD_FOLDER}
git clone https://aur.archlinux.org/tcllauncher
cd tcllauncher
makepkg -si

echo ""
echo -e "\e[1;95mInstallation of Build Tools and Dependency packages completed \e[39m"
echo ""
echo -e "\e[1;32mNow Building and Installing package PIAWARE \e[39m"
echo ""
sleep 3
cd ${BUILD_FOLDER}/archlinux-piaware
makepkg -si


