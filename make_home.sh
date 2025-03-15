#!/bin/sh
if [ $(id -u) -ne 0 ]
  then echo Please run this script as root or use sudo!
  exit
fi

# install applets
echo "**** Installing applets"
cd ~/.local/share/cinnamon/applets/
wget "https://cinnamon-spices.linuxmint.com/files/applets/weather@mockturtl.zip" && unzip weather@mockturtl.zip
wget "https://cinnamon-spices.linuxmint.com/files/applets/Cinnamenu@json.zip" && unzip Cinnamenu@json.zip
rm *zip

# installing programs 1
echo "**** Installing apps used in dconf"
apt install -y rofi
mkdir ~/.config/rofi
rofi -dump-config > ~/.config/rofi/config.rasi
echo '@theme "android_notification"' >> ~/.config/rofi/config.rasi
echo "**** Config DPI!"
apt install -y flameshot
echo "*** Import flameshot config manually"
apt install -y diodon
echo "**** diodon config: use clipboard, keep cb content, automatically paste, 30 items"
mkdir -p ~/.userscripts
cp focus_terminal.sh ~/.userscripts/focus_terminal.sh
apt install -y plank

# loading dconf
echo "**** Loading dconf"
dconf load / < dconf.backup

# installing programms 2
echo "**** Installing apps"
apt install -y git
apt install -y fzf
git clone https://github.com/Aloxaf/fzf-tab ~/.zfunc
apt install -y zoxide
apt install -y eza
apt install -y nnn
apt install -y bat
apt install -y zsh-completions
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
cp n ~/.zfunc
cp .zshrc ~
cp .zshenv ~

echo "**** Done! Don't forget to set startup applications"
