### Piaware package for Arch Linux and AlarmPi
#### Clones source code from Flightaware Github Repositories, and Builds Piaware package consisting of following components in a single package:</br>
- Piaware
- faup1090


#### OPTION-1: Fully automated install </br>The installation script creates a dedicated folder "/usr/share/piaware-builder" and all cloned code and built packages are saved in it
Copy paste the script below in terminal and press Enter Key. The script will do everything for you, except that it will ask you provide password and your permission [yes/no] when installing packages of build tools and dependencies, and of course for installing piaware itself..

```
bash -c "$(wget -O - https://github.com/abcd567a/archlinux-piaware/raw/master/piaware-builder.sh)"  

```

#### OPTION-2: Manual Install:

#### 2.1 - Install tools required to build packages - First thing to be done before attempting to build package </br>
`sudo pacman -S --needed git fakeroot patch gcc make autoconf `


#### 2.2 - Build and Install depencies not available in repository.</br>
NOTE: Building these requires build tools (item 2.1 above) to be installed first.</br>

**2.2.1 - tcllib** </br>
```
cd ~/
git clone https://aur.archlinux.org/tcllib  
cd tcllib  
makepkg -si  
```

**2.2.2 - tclx** </br>

```
cd ~/
git clone https://aur.archlinux.org/tclx  
cd tclx  
makepkg -si  
```

**2.2.3 - tcltls** </br>
```
cd ~/
git clone https://aur.archlinux.org/tcltls  
cd tcltls  
makepkg -si  
```

**2.2.4 - tcllauncher** </br>
```
cd ~/
git clone https://aur.archlinux.org/tcllauncher  
cd tcllauncher  
makepkg -si  
```

**2.2.5 - mlat-client** </br>
```
cd ~/
git clone https://github.com/abcd567a/archlinux-mlat-client  
cd archlinux-mlat-client 
makepkg -si  
```

</br>

#### 3 - Build Piaware package: </br>

```
cd ~/
git clone https://github.com/abcd567a/archlinux-piaware   
cd archlinux-piaware   
makepkg -si  
cd ../  
```
