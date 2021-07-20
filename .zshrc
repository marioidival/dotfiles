# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/Users/kakarotto/.oh-my-zsh"

ZSH_THEME="cloud"

plugins=(git cargo golang)

source $ZSH/oh-my-zsh.sh

. $HOME/.asdf/asdf.sh

export PATH=/usr/sbin:$PATH
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit
