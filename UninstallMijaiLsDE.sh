#!/usr/bin/env bash

if ! command -v apt-get &> /dev/null
then
    echo "apt-get could not be found ..."
    exit
fi

if ! command -v snap &> /dev/null
then
    echo "snap could not be found ..."
    exit
fi

if [ "$EUID" -ne 0 ]
then 
	echo "To uninstall the DE is necessary to be root too!"
  	exit
fi

echo "[1/2]Deleting the folder (/usr/local/bin/MijaiLsDE) ..."
sudo rm -rf /usr/local/bin/MijaiLsDE
echo "[2/2]Deleting the .desktop file (/usr/share/xsessions/)"
sudo rm -i /usr/share/xsessions/MDE.desktop
echo "Done! Packages need to be removed manually since they can be in your system and can be essential for your main DE to run."
echo "List of packages to remove manually and optionally:"
echo "(using apt-get) xfwm4, lxqt-panel"
echo "(using snap) wonderwall"
echo "(using apt) ulauncher"

