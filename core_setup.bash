#!/bin/bash

#install curl, tmux and neovim plugin dependencies
sudo apt install curl tmux xclip ripgrep -y

# install zsh
sudo apt install zsh -y && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
sudo apt-get install fonts-powerline -y && \
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k && \
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
zsh -c 'print zsh installed correctly :D'

# install the Nerd Font recommended by powerlevel10k, so prompt icons render correctly
mkdir -p $HOME/.local/share/fonts
for style in Regular Bold Italic "Bold%20Italic"; do
    curl -fLo "$HOME/.local/share/fonts/MesloLGS NF ${style//%20/ }.ttf" \
        "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20${style}.ttf"
done
fc-cache -f "$HOME/.local/share/fonts"

# install nvim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim -y
pip3 install pynvim
