## Piaware package for Arch Linux and AlarmPi
### Clones source code from Flightaware and mutability Github Repositories, and Builds Piaware package consisting of following components in a single package:</br>
- Piaware
- faup1090
- fa-mlat-client

## OPTION-1: Fully automated install

Copy paste the script bellow in terminal and press Enter Key. The script will do everything for you, except that it will ask you provide password and your permission [yes/no] when installing build tools and dependency packages.

```
git clone https://github.com/abcd567a/archlinux-piaware && bash archlinux-piaware/build-piaware.sh

```

</br>

## OPTION-2: Manual Method:

## 1 - Prepration </br>
### 1.1 - Install tools required to build packages - First thing to be done before attempting to build ANY package </br>
`sudo pacman --needed -Sy fakeroot binutils git autoconf make gcc glibc patch which`
</br>
### 1.2 - Install dependencies available in Arch Linux Repository </br>
`sudo pacman --needed -Sy tcl python python-setuptools python-build python-installer tk net-tools `
</br>
### 1.3 - Build and Install depencies not available in repository.</br>
NOTE: Building these requires build tools (item 1.1 and 1.2 above) to be installed first.</br>

**1.3.1 - tcllib** </br>
```
cd ~/
git clone https://aur.archlinux.org/tcllib  
cd tcllib  
makepkg -si  
```

**1.3.2 - tclx** </br>

```
cd ~/
git clone https://aur.archlinux.org/tclx  
cd tclx  
makepkg -si  
```

**1.3.3 - tcltls** </br>
```
cd ~/
git clone https://aur.archlinux.org/tcltls  
cd tcltls  
makepkg -si  
```

**1.3.4 - tcllauncher** </br>
```
cd ~/
git clone https://aur.archlinux.org/tcllauncher  
cd tcllauncher  
makepkg -si  
```
</br>

## 2 - Build Piaware package: </br>

```
cd ~/
git clone https://github.com/abcd567a/archlinux-piaware   
cd archlinux-piaware   
makepkg -si  
cd ../  
```
