My standard set of dotfiles. For now, it's just small vim/tmux config files and setup.sh.

In order to install, run

1. `git clone --recursive https://github.com/zachverb/dotfiles.git ~/dotfiles`
2. `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
3. `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
4. `chmod a+x ~/dotfiles/setup.sh && ~/dotfiles/setup.sh`

