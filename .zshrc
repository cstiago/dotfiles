# ===== I/O operations =====
fortune | cowsay

# ===== Powerlevel10k Instant Prompt =====

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ===== Zsh configuration =====

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="%a %d/%m/%y %H:%M:%S"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

plugins=(git)

source $ZSH/oh-my-zsh.sh

# ===== User configuration =====

# Powerlevel10k
source ~/.powerlevel10k/powerlevel10k.zsh-theme
[[ -s ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Populate $MANPATH
export MANPATH=$(manpath -q)

# cstiago/dotfiles
source $HOME/.zshutils

export DFDIR=$HOME/dotfiles
export BINDIR=$DFDIR/bin

append_to_env PATH $BINDIR
append_to_env PATH $DFDIR/install

export DEBREPO=deb
export DEBREPOTXT=$DFDIR/install/$DEBREPO.txt
export DEBREPODIR=/usr/local/$DEBREPO
export DEBREPOLIST=/etc/apt/sources.list.d/$DEBREPO.list

# cstiago/procs
export PROCDIR=$HOME/procs

# local
append_to_env PATH /usr/local/bin
append_to_env PATH $HOME/.local/bin

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# TeX Live
TEXBIN=/usr/local/texlive/2024/bin/x86_64-linux
TEXMAN=/usr/local/texlive/2024/texmf-dist/doc/man
TEXINFO=/usr/local/texlive/2024/texmf-dist/doc/info

append_to_env PATH $TEXBIN
append_to_env MANPATH $TEXMAN
append_to_env INFOPATH $TEXINFO

return 0
