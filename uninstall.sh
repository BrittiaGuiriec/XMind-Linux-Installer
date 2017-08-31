#!/bin/bash
##
## XMind 8 Uninstall
##
## Author: DinoLai
## Email: dinos80152@gmail.com
## Fork from: https://github.com/mriza/XMind-Linux-Installer
##
## Licensed under GPL V3
## Please refer to https://www.gnu.org/licenses/gpl-3.0.en.html
##
## example
## sudo bash uninstall.sh

status_flag=0
echo "Uninstalling XMind"

echo "Removing xmind files..."
rm -rf /opt/xmind/
if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Removing user data..."
rm -rf $HOME/workspace
if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Removing configs..."
rm -rf $HOME/.configuration
if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Removing launcher, mime, icon, system data..."
rm -rf /usr/share/applications/xmind.desktop \
/usr/share/fonts/truetype/xmind \
/usr/share/lintian/overrides/xmind \
/usr/share/man/man1/XMind.1.gz \
/usr/share/mime/packages/xmind.xml \
/usr/share/pixmaps/XMind.png
if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Removing command"
rm -f /usr/bin/XMind
if [ $? != 0 ]
then
  status_flag=1
  echo "Failed"
else
  echo "OK"
fi

echo "Update mime database and font cache, please waiting few seconds..."
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

if [ $status_flag != 0 ]
then
  echo "Some errors found..."
  exit 1
else
  echo "Uninstallation finished succesfully"
  exit 0
fi
