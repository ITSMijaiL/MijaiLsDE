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
sudo mkdir /usr/local/bin/MijaiLsDE
#Download the installer script
sudo wget https://raw.githubusercontent.com/ITSMijaiL/MijaiLsDE/main/InstallMijaiLsDE.sh -P /usr/local/bin/MijaiLsDE/Downloads
#Download the uninstaller
sudo wget https://raw.githubusercontent.com/ITSMijaiL/MijaiLsDE/main/UninstallMijaiLsDE.sh -P /usr/local/bin/MijaiLsDE/Downloads
#Run it
sudo bash /usr/local/bin/MijaiLsDE/Downloads/InstallMijaiLsDE.sh
#Profit?
