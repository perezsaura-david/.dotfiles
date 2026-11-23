#!/bin/bash

source ~/.zsh_profile
sudo apt install build-essential python3-dev -y
sudo apt install clang-format -y

#for copilot we need to install node js 12 or superior
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# install plugins in nvim (lazy.nvim bootstraps itself on first launch via init.lua)
nvim --headless "+Lazy! sync" +qa

