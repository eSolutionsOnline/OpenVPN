#!/bin/bash
# wget https://raw.githubusercontent.com/eSolutionsOnline/OpenVPN/master/install.sh && chmod 0777 install.sh && ./install.sh

user=$USER
install_source="/home/$user/install/"



echo '.___                 __         .__  .__      _________            .__        __   '
echo '|   | ____   _______/  |______  |  | |  |    /   _____/ ___________|__|______/  |_ '
echo '|   |/    \ /  ___/\   __\__  \ |  | |  |    \_____  \_/ ___\_  __ \  \____ \   __\'
echo '|   |   |  \\___ \  |  |  / __ \|  |_|  |__  /        \  \___|  | \/  |  |_> >  |  '
echo '|___|___|  /____  > |__| (____  /____/____/ /_______  /\___  >__|  |__|   __/|__|  '
echo '         \/     \/            \/                    \/     \/         |__|         '
echo "V1.0.0"
echo ""
echo ""

echo -e "\e[1m\e[5m\033[31m!!!WARINING!!!\e[0m\e[25m\e[21m"

mkdir install
mkdir connections
wget https://raw.githubusercontent.com/eSolutionsOnline/OpenVPN/master/core.sh -O install/core.sh
wget https://raw.githubusercontent.com/eSolutionsOnline/OpenVPN/master/userconfig.sh -O install/userconfig.sh
wget https://raw.githubusercontent.com/eSolutionsOnline/OpenVPN/master/openvpn-install.sh -O install/openvpn-install.sh
wget https://raw.githubusercontent.com/eSolutionsOnline/OpenVPN/master/openvpn-config.sh -O openvpn
chmod -R 0777 install
chmod 0777 openvpn
chmod -R 0777 connections

sudo bash $install_source"core.sh" "$user"
echo ""
echo ""
bash $install_source"userconfig.sh" "$user"
echo ""
echo ""
sudo bash $install_source"openvpn-install.sh"
echo ""
echo ""

rm -R install
rm $0

echo "All scripts have been executed and removed"
echo ""
echo ""

echo -e "\e[1m\e[5m\033[31m!!!IMPORTANT!!!\e[0m\e[25m\e[21m"
echo "It is recomended that you reboot the server now for all changes to take effect"
echo ""
