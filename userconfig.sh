#!/bin/bash
###### userconfig.sh
user=$1

echo "Generate a RSA key"
ssh-keygen -t rsa

echo  "Copying to the home folder"
cp /home/$user/.ssh/id_rsa.pub /home/$user/$user.pub

echo -e "\e[1m\e[5m\033[31m!!!IMPORTANT!!!\e[0m\e[25m\e[21m"
read -p "Your new public key is in your home folder [press any key to continue] "
echo ""
echo ""
cat /home/$user/$user.pub
echo ""
echo ""
echo ""

echo "Setting vendor bin path"
echo 'PATH="./vendor/bin:$PATH"' >> ~/.profile

echo "Setting default home folder"
echo "cd /home/$user" >> ~/.profile

echo "echo ' ________  ________  _______   ________  ___      ___ ________  ________       '" >> ~/.profile
echo "echo '|\   __  \|\   __  \|\  ___ \ |\   ___ \|\  \    /  /|\   __  \|\   __  \      '" >> ~/.profile
echo "echo '\ \  \|\  \ \  \|\  \ \   __/|\ \  \ \  \ \  \  /  / | \  \|\  \ \  \ \  \     '" >> ~/.profile
echo "echo ' \ \  \ \  \ \   ____\ \  \_|/_\ \  \ \  \ \  \/  / / \ \   ____\ \  \ \  \    '" >> ~/.profile
echo "echo '  \ \  \ \  \ \  \___|\ \  \_|\ \ \  \ \  \ \    / /   \ \  \___|\ \  \ \  \   '" >> ~/.profile
echo "echo '   \ \_______\ \__\    \ \_______\ \__\ \__\ \__/ /     \ \__\    \ \__\ \__\  '" >> ~/.profile
echo "echo '    \|_______|\|__|     \|_______|\|__|\|__|\|__|/       \|__|     \|__|\|__|  '" >> ~/.profile
echo 'cowsay "To configure the OpenVPN server run ./openvpn.sh the connection files are stored in /connections mooooooooo"' >> ~/.profile


echo "Add an SSH key"
read -p "Would you like to add an SSH key? [y/N]? "
if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p "Please paste you key "
    if [[ $REPLY ]]; then
        echo ""
        
        cat > /home/$user/.ssh/authorized_keys << EOF
$REPLY
EOF
        cat > /home/$user/.ssh/authorized_keys2 << EOF
$REPLY
EOF

    else
        echo "No key to add."
    fi
fi
echo ""
echo ""