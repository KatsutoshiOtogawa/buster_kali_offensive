#! /bin/bash

apt update && apt upgrade -y

echo "# kali-last-snapshot is " >> /etc/apt/sources.list
echo "deb http://http.kali.org/kali kali-last-snapshot main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://http.kali.org/kali kali-last-snapshot main contrib non-free" >> /etc/apt/sources.list

mkdir /etc/apt/preferences.d 2> /dev/null
cp /vagrant/kali-linux.pref /etc/apt/preferences.d/kali-linux.pref

if cat /etc/debian_version | grep 10. > /dev/null; then
    wget -qO- https://archive.kali.org/archive-key.asc | apt-key add
    # Since apt-key is deprecated in debian 11 and later, use below.
    # apt-key will be removed in debian 12.
    # elif cat /etc/debian_version | grep 11. > /dev/null; then
    #   wget https://archive.kali.org/archive-key.asc
    #   gpg --no-default-keyring --keyring /etc/apt/trusted.gpg.d/kali-repository.gpg --import ./archive-key.asc
fi

apt update

# install metasploit-db
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod u+x msfinstall
./msfinstall
rm ./msfinstall

## if you want to use desktop, uncomment below rows.
# apt -y install task-gnome-desktop
# apt -y install task-japanese locales-all
# localectl set-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"

apt clean

# defrag
dd if=/dev/zero of=/EMPTY bs=1M; rm -f /EMPTY
