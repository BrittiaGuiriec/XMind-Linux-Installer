# XMind-Linux-Installer

A simple BASH script to install XMind on Debian/Ubuntu 32/64 bit, include Launcher, MIME type link and icon.

## How to use

1. change to the user you want to install
1. Download XMind from [XMind Official Website](http://www.xmind.net/download/linux/)
1. Download this [repository](https://github.com/dinos80152/XMind-Linux-Installer/archive/master.zip)
1. Unzip `XMind-Linux-Installer-master.zip` and put `xmind-8-update*-linux.zip` file in `XMind-Linux-Installer-master` directory
1. Open Terminal, and change to `XMind-Linux-Installer-master` directory
1. Run installer, `sudo bash xmind-installer.sh`

## What's Installer Script Do

1. Installing dependencies
1. Extracting xmind zip file to /opt/xmind
1. Creating XMind command
1. Creating launcher, MIME and icon
1. Creating workspace
1. Setting XMind.ini
1. Updating MIME database, Desktop database and font cache
1. Finish Installation

## What's Uninstall Script do

1. Removing xmind files
1. Removing workspace and configuration from user HOME directory
1. Removing system data like launcher, mime link, icon, etc...
1. Removing command
1. Updating system database like mime, font

## Reference

This script is base on [mriza/XMind-Linux-Installer](https://github.com/mriza/XMind-Linux-Installer) and [XMind for linux beta deb file](http://www.xmind.net/download/beta/)

* [How to install & run Xmind v. 8 in Ubuntu 16.04?](https://askubuntu.com/questions/869848/how-to-install-run-xmind-v-8-in-ubuntu-16-04)
* [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/index.html)