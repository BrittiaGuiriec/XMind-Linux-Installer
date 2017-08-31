#!/bin/bash
##
## XMind 8 Installer
##
## Author: DinoLai
## Email: dinos80152@gmail.com
## Fork from: https://github.com/mriza/XMind-Linux-Installer
##
## Licensed under GPL V3
## Please refer to https://www.gnu.org/licenses/gpl-3.0.en.html
##
## How to use this script
## 1. Download XMind zip file from official website
## 2. run the script using privileged user or using sudo command
##
## example
## sudo bash xmind8-installer.sh

status_flag=0
ARCH=`uname -m`
XMIND_DIR="/opt/xmind"
if [ $ARCH == "x86_64" ]
then
	VERSION="XMind_amd64"
	BIN_DIR=$XMIND_DIR/$VERSION
elif [ $ARCH == "i686" ]
then
	VERSION="XMind_i386"
	BIN_DIR=$XMIND_DIR/$VERSION
else
	echo 'Sorry, cannot verify your OS architecture'
	echo 'The installer will now exit'
	exit 1
fi

echo "[setup] Installing dependencies...."
apt-get install default-jre libgtk2.0-0 libwebkitgtk-1.0-0 lame libc6 libglib2.0-0
if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Extracting files..."
unzip -q xmind-8-update?-linux.zip -d xmind
if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Installing..."
mv xmind /opt/
if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Create command..."
if [ $VERSION == "XMind_amd64" ]
then
  cp usr/bin/XMind_64 /usr/bin/XMind
else
  cp usr/bin/XMind_32 /usr/bin/XMind
fi
if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Copy share folder to /usr/share for create launcher, mime, and icon..."
cp -dR --no-preserve all usr/share/. /usr/share/.
if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Creating workspaces..."
mkdir $HOME/{workspace,.configuration}
cp -R $BIN_DIR/configuration/* $HOME/.configuration
chown -R $SUDO_USER:$SUDO_GID $HOME/workspace $HOME/.configuration
if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Post installatin configurations..."
sed -i "s/\.\.\/workspace/@user\.home\/workspace/g" "$BIN_DIR/XMind.ini"
sed -i "s/\.\/configuration/@user\.home\/\.configuration/g" "$BIN_DIR/XMind.ini"
sed -i "s/^\.\./\/opt\/xmind/g" "$BIN_DIR/XMind.ini"
if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Updating mime database and font cache, please waiting few seconds..."
# Update application mime database
update-mime-database /usr/share/mime/

# Update mime cache database
update-desktop-database /usr/share/applications

# Update font cache
fc-cache --force

if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Installation finished. Happy mind mapping!"
