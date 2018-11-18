echo "Update Package List & System Packages"
apt-get update
apt-get -y upgrade

echo "Install Some Basic Packages"
apt-get install ufw curl ntpdate cowsay

echo "Set My Timezone"
ln -sf /usr/share/zoneinfo/UTC /etc/localtime
ntpdate -s ntp.ubuntu.com
dpkg-reconfigure tzdata
ntpdate -s ntp.ubuntu.com