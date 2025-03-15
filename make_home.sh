#!/bin/sh
if [ $(id -u) -ne 0 ]
  then echo Please run this script as root or use sudo!
  exit
fi
UHOME=$(getent passwd $SUDO_USER | cut -d: -f6)

# install applets
echo "**** Installing applets"
wget "https://cinnamon-spices.linuxmint.com/files/applets/weather@mockturtl.zip" && unzip weather@mockturtl.zip -d $UHOME/.local/share/cinnamon/applets/
wget "https://cinnamon-spices.linuxmint.com/files/applets/Cinnamenu@json.zip" && unzip Cinnamenu@json.zip -d $UHOME/.local/share/cinnamon/applets/
rm *zip

# installing programs 1
echo "**** Installing apps used in dconf"
apt install -y rofi
mkdir $UHOME/.config/rofi
rofi -dump-config > $UHOME/.config/rofi/config.rasi
echo '@theme "android_notification"' >> $UHOME/.config/rofi/config.rasi
echo "**** Config DPI!"
apt install -y flameshot
echo "*** Import flameshot config manually"
apt install -y diodon
echo "**** diodon config: use clipboard, keep cb content, automatically paste, 30 items"
mkdir -p $UHOME/.userscripts
cp focus_terminal.sh $UHOME/.userscripts/focus_terminal.sh
apt install -y plank

# loading dconf
echo "**** Loading dconf"
dconf load / < dconf.backup

# installing programms 2
echo "**** Installing apps"
apt install -y git
apt install -y fzf
git clone https://github.com/Aloxaf/fzf-tab $UHOME/.zfunc
apt install -y zoxide
apt install -y eza
apt install -y nnn
apt install -y bat
wget "https://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_22.04/amd64/zsh-completions_0.34.0-1+2.1_amd64.deb"
dpkg -i "zsh-completions_0.34.0-1+2.1_amd64.deb"
apt install -y git-delta
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
# micro
curl https://getmic.ro | bash
mv micro /usr/bin
git config --global core.editor micro

# zshrc config
echo "**** Configuring .zshrc"
cp n $UHOME/.zfunc
cp .zshrc $UHOME/
cp .zshenv $UHOME/

echo "**** Done! Don't forget to set startup applications"
