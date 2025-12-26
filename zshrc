# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export PATH=$(brew --prefix)/sbin:$(brew --prefix)/bin:$PATH:$HOME/bin
# alias tmux='tmux -2'  # for 256color
alias tmux='tmux -u'  # to get rid of unicode rendering problem
alias n="nvim"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"
DEFAULT_USER="zacharyverbeck"

if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

lugins=(git vi-mode tmux)

export GOPATH="$HOME/gocode"
export PATH="$PATH:$GOPATH/bin"

source $ZSH/oh-my-zsh.sh

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export SSL_CERT_FILE="$(brew --prefix openssl@3)"/cert.pem

source <(fzf --zsh)

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export EDITOR="nvim"
export VISUAL="nvim"

alias vim="nvim"
alias vi="nvim"
