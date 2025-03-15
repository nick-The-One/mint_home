if ps aux | grep "[g]nome-terminal" > /dev/null
	then wmctrl -Fa 'Terminal'
	else gnome-terminal
fi
