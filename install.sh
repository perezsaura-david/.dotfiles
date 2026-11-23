#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export DOTFILES
cd "$DOTFILES"

echo "==> Installing packages (zsh, tmux, neovim, fonts...)"
bash core_setup.bash

echo "==> Symlinking configs and installing nvim plugins"
bash plugin_setup.bash

echo
echo "Done. Start a new terminal (or run 'exec zsh') to use the new shell."
echo "If prompt icons look broken, set your terminal's font to 'MesloLGS NF'."
