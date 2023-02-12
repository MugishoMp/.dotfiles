#!/bin/bash

###############################################################################
# The directory name this file lives in
###############################################################################
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)




###############################################################################
# install vundle
###############################################################################
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim




###############################################################################
# setup python to use youcompleteme
###############################################################################
python3 -m pip install --user --upgrade pynvim




###############################################################################
#link nvim config file
###############################################################################
if [[ ! -e ~/.config/nvim/init.vim ]]; then
	echo "file doesnt exists"
	mkdir -p ~/.config/nvim/
	touch ~/.config/nvim/init.vim
fi

ln -s -f $SCRIPT_DIR"/.config/nvim/init.vim" ~/.config/nvim/init.vim




###############################################################################
# install fish
###############################################################################
if [[ ! -e /usr/local/bin/fish ]]; then
	brew install fish
fi
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
