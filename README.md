# neovim-init.vim
install brew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` and follow the instruction;

and add to `~/.zshrc` or `~/.bashrc` ---> `eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)`


install neovim(>=)0.5: `brew install --HEAD luajit`

`brew install --HEAD neovim`

create folder: `cd ~/.config/`
clone this repo: `https://github.com/pietow/neovim-init.vim.git nvim && nvim`

`nvim init.vim` ---> `:PlugInstall`
