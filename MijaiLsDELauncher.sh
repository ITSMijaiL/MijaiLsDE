#!/bin/bash
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

if ! command -v wget &> /dev/null
then
    echo "wget could not be found ..."
    exit
fi

if [ "$EUID" -ne 0 ]
then 
	echo "To download the DE installer its necessary to be root!"
  	exit
fi
cd $HOME/Downloads
#Download the installer script
sudo wget https://raw.githubusercontent.com/ITSMijaiL/MijaiLsDE/main/InstallMijaiLsDE.sh
#Download the uninstaller
sudo wget https://raw.githubusercontent.com/ITSMijaiL/MijaiLsDE/main/UninstallMijaiLsDE.sh
#Run it
sudo bash InstallMijaiLsDE.sh
#Profit?

