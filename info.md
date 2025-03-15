* install shit
* setup things with configs and envs
* just backup dconf and restore it after installing all missing applets:
Applet download URL can be found on the applet's page: https://cinnamon-spices.linuxmint.com/applets/view/17
`wget https://cinnamon-spices.linuxmint.com/files/applets/placesCenter@scollins.zip && unzip placesCenter@scollins.zip`  
`dconf dump / > dconf.dump`  
`dconf load / < dconf.dump`
* applet configs path: home/nick/.config/cinnamon/spices/*
* should get you close enough


details:  
* download & unzip applets
* install rofi (apt)
	* theme load? echo '@theme "android_notification" >> config'
	* dpi scale?
* install flameshot
* install diodon
* focus terminal
* install plank
* load dconf
* fzf
	* fzf-tab
* zoxide
* exa (eza?)
* micro
* delta + pager
* nnn
* xclip
* bat
* zsh-completions
* zfunc
* slim zshrc


git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3



app configs:  
* rofi 			-- generated
* flameshot 	-- import from gui
* diodon 		-- manual setup 
* plank 		-- dconf
* fzf			-- zshrc
	* fzf-tab 	-- zshrc
* nnn 			-- zshrc
* bat			-- none?
* delta			-- gitconfig
