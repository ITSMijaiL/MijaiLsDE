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

if ! command -v wget &> /dev/null
then
    echo "wget could not be found ..."
    exit
fi

if [ "$EUID" -ne 0 ]
then 
	echo "To install the DE is necessary to be root!"
  	exit
fi

#Package Name: 				| Used as:
#xfce WM (xfwm4)	   		| Windows Manager
#LXQT Panel (lxqt-panel)	| Panel
#Wonderwall (wonderwall)	| Wallpaper Manager
#Ulauncher (ulauncher)		| Apps Launcher


echo "[0/5]Doing some preparations ..."
sudo mkdir /usr/local/bin/MijaiLsDE
sudo mkdir /usr/local/bin/MijaiLsDE/DebPKGS

echo "[1/5]Installing packages (apt-get) ..."
sudo apt-get install xfwm4 lxqt-panel
sudo snap install wonderwall

echo "[2/5]Downloading & installing packages (wget) ..."
sudo wget https://github.com/Ulauncher/Ulauncher/releases/download/5.11.0/ulauncher_5.11.0_all.deb -P /usr/local/bin/MijaiLsDE/DebPKGS
sudo apt install /usr/local/bin/MijaiLsDE/DebPKGS/ulauncher_5.11.0_all.deb

echo "[3/5]Making DE initialization script in /usr/local/bin/MijaiLsDE/MDE.sh ..."
sudo touch /usr/local/bin/MijaiLsDE/MDE.sh
sudo cat > /usr/local/bin/MijaiLsDE/MDE.sh << "EOF"
exec xfwm4 &
exec lxqt-panel &
exec ulauncher &
exec wonderwall
EOF

sudo chmod +x /usr/local/bin/MijaiLsDE/MDE.sh

echo "[4/5]Making the .desktop file (/usr/share/xsessions/)"
sudo touch /usr/share/xsessions/MDE.desktop
sudo cat > /usr/share/xsessions/MDE.desktop << "EOF"
[Desktop Entry]
Name=MijaiLsDE
Comment=MijaiLs desktop environment
Exec=/usr/local/bin/MDE.sh
Type=Application
EOF

echo "[5/5] Done! Restart or logout to initiate the DE."
