#!/bin/bash
LauncherVersion="1.1"
VersionFromGithub=$( curl -# -L "https://raw.githubusercontent.com/ITSMijaiL/MijaiLsDE/main/Version.txt" 2> '/dev/null' )

if [ "$EUID" -ne 0 ]
then 
	echo "To download the DE installer its necessary to be root!"
  	exit
fi

if  [  "$LauncherVersion" = "$VersionFromGithub" ];
then
	echo "Launcher is up-to-date!"
else
	echo "Launcher is not up-to-date! Downloading the new launcher and exitting..."
	sudo rm -i $(pwd)/MijaiLsDELauncher.sh
	sudo wget https://raw.githubusercontent.com/ITSMijaiL/MijaiLsDE/main/MijaiLsDELauncher.sh -P $(pwd)
	exit
fi

if ! command -v curl &> /dev/null
then
    echo "curl could not be found ..."
    exit
fi

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
sudo mkdir /usr/local/bin/MijaiLsDE
#Download the installer script
sudo wget https://raw.githubusercontent.com/ITSMijaiL/MijaiLsDE/main/InstallMijaiLsDE.sh -P /usr/local/bin/MijaiLsDE/Downloads
#Download the uninstaller
sudo wget https://raw.githubusercontent.com/ITSMijaiL/MijaiLsDE/main/UninstallMijaiLsDE.sh -P /usr/local/bin/MijaiLsDE/Downloads
#Run it
sudo bash /usr/local/bin/MijaiLsDE/Downloads/InstallMijaiLsDE.sh
#Profit?
