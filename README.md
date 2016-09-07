My standard set of dotfiles. For now, it's just small vim/tmux config files and setup.sh.

In order to install, run

1. `git clone --recursive https://github.com/zachverb/dotfiles.git ~/dotfiles`
2. `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
3. `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
4. `chmod a+x ~/dotfiles/setup.sh && ~/dotfiles/setup.sh`

Enjoy!

A few things to note:
* Create your own file called uprofile inside of the dotfiles folder to add your own personal zsh configuration
* Make your own configurations to [tmux-powerline segments](https://github.com/erikw/tmux-powerline#segment-requirements) for extra fun
