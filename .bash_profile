#!/usr/bin/env bash

alias "ls"="ls -al"
alias "lsl"="ls -l"
alias "cls"="clear"
alias "dir"="ls -alF"
alias "shutter_count"="killall PTPCamera ; gphoto2 --get-config /main/status/shuttercounter"
alias "ll"="ls"
alias "gti"="git"
alias be="bundle exec"

# Enable colors, and set the colors
export CLICOLOR=1

export PATH=/usr/local/bin:$PATH

# Suppress zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# Colorized Git branch
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
NORMAL="\[\e[0m\]"
YELLOW="\[\e[0;33m\]"

# <Current Directory> (<Branch Name>)
# PS1='\w $(__git_ps1 "'$YELLOW'(%s) ")'$NORMAL'\$ '

# <Current Directory> (<Branch Name>) [pair]
PS1='\w'$YELLOW'$(parse_git) '$NORMAL'\n\$ '

# <username>@<Machine Name> <Current Directory> (<Branch Name>)
# PS1='\u@\h \w $(__git_ps1 "'$YELLOW'(%s) ")'$NORMAL'\n\$ '

# <username>@<Machine Name> <Current Directory> (<Branch Name>) [pair]
# PS1='\u@\h \w'$YELLOW'$(parse_git) '$NORMAL'\n\$ '

# function to show git status on command prompt
function parse_git {
  BRANCH="$(__git_ps1)"
  PAIR=`git config --get user.initials`
  if [ "$PAIR" == "" ] ; then
    PAIR='UNPAIRED'
  fi
  if [ "$BRANCH" != "" ] ; then
    echo "$BRANCH [$PAIR]"
  fi
}

# Git Auto-Complete (bash-completion via brew)
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

ulimit -n 4096

# Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

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
