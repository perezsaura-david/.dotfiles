# My .dotfiles
For setting up the configuration of :
- NeoVim (https://neovim.io/)
- Tmux (http://www.sromero.org/wiki/linux/aplicaciones/tmux)
- Zsh with OhMyZsh (https://ohmyz.sh/ )


## Setup steps:

1. Clone the repository into ```~/.dotfiles```

```
$ git clone https://github.com/perezsaura-david/.dotfiles.git $HOME/.dotfiles 
```

2. Run the installer, which installs NeoVim, Tmux, Zsh/OhMyZsh, the
   Neovim plugin dependencies (xclip, ripgrep, pynvim), a Nerd Font for
   the prompt icons, then symlinks the configs and installs the nvim
   plugins:

```
$ cd ~/.dotfiles
$ bash install.sh
```

3. Start a new terminal (or run ```exec zsh```) to pick up the new shell.

>[INFO] My zsh theme is powerlevel10k. `install.sh` installs the recommended
>"MesloLGS NF" font automatically, but you still need to set it as your
>terminal emulator's font yourself. See https://github.com/romkatv/powerlevel10k#fonts
>for details.

## Coc languages Servers (https://github.com/neoclide/coc.nvim)

For installing basic languages run the desired command into nvim:

> C++ language server

```
:CocInstall coc-clangd
:CocCommand clangd.install
``` 

> Python language server
```
:CocInstall coc-pyright
``` 
## Vimspector (https://github.com/puremourning/vimspector#vimspector---a-multi-language-graphical-debugger-for-vim )
For setup vimspector plugin run: 
```
$ cd $HOME/.local/share/nvim/lazy/vimspector
$ ./install_gadget.py --all
```
After that you must add a ```.vimspector.json ``` in the root folder of your project with your desired configuration.
An example ```.vimspector.json``` file for cpp debuggin can be:
```
{
  "configurations" : {
    "Launch":{
      "adapter": "vscode-cpptools",
      "configuration":{
        "request": "launch",
        "program": "<YOUR FILE TO RUN: for example ./build/test",
        "cwd": "${workspaceFolder}",
        "externalConsole": true,
        "MIMode": "gdb"
      }
    }
  }
}
```
> [WARN] This debugger does not compile your code, you must compile it before debugging. For compiling C++ projects I use neovim-cmake plugin.

For more info of how to create this file for the different languages go to the plugin webpage.



## Common errors:


If c++ autocompletion fails with std libs run: [See this post](https://stackoverflow.com/questions/74785927/clangd-doesnt-recognize-standard-headers)

```
$ apt install libstdc++-12-dev

```
