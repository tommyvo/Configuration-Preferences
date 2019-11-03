#!/usr/bin/env bash

alias "ls"="ls -al"
alias "lsl"="ls -l"
alias "cls"="clear"
alias "dir"="ls -alF"
alias "ll"="ls"
alias "gti"="git"
alias be="bundle exec"

# Enable colors, and set the colors
export CLICOLOR=1

export PATH=/usr/local/bin:$PATH

# Colorized Git branch
source ~/.git-prompt.sh

NORMAL="\[\e[0m\]"
YELLOW="\[\e[0;33m\]"
NEWLINE=$'\n'

# function to show git status on command prompt
# TODO: this does not show when a branch has been modified
function parse_git() {
  BRANCH="$(__git_ps1)"
  PAIR="$(git config --get user.initials)"
  if [ "$PAIR" = "" ] ; then
    PAIR='UNPAIRED'
  fi
  if [ "$BRANCH" != "" ] ; then
    echo "$BRANCH [$PAIR]"
  fi
}

# <Current Directory> (<Branch Name>) [pair]
precmd() { PROMPT="%d%F{yellow}$(parse_git)%f${NEWLINE}$ " }

# Load Git completion (https://medium.com/@oliverspryn/adding-git-completion-to-zsh-60f3b0e7ffbc)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

ulimit -n 4096

# Zeus helper function
function z() {
  zeus --log log/zeus.log --file-change-delay 1s $*
}

# rbenv
eval "$(rbenv init -)"

# Fuck spring
export DISABLE_SPRING=true

# Adds NVM to path, because it fucking sucks.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
