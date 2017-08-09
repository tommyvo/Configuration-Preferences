alias "ls"="ls -al"
alias "lsl"="ls -l"
alias "cls"="clear"
alias "dir"="ls"
alias "shutter_count"="killall PTPCamera ; gphoto2 --get-config /main/status/shuttercounter"
alias "ll"="ls"
alias "gti"="git"
alias "sr"="redis-server /usr/local/etc/redis.conf"
alias "sp"="postgres -D /usr/local/var/postgres"

# Enable colors, and set the colors
export CLICOLOR=1

export PATH=/usr/local/bin:$PATH

# Colorized Git branch
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
NORMAL="\[\e[0m\]"
YELLOW="\[\e[0;33m\]"

# <Current Directory> (<Branch Name>)
PS1='\w $(__git_ps1 "'$YELLOW'(%s) ")'$NORMAL'\$ '

# <Current Directory> (<Branch Name>) [pair]
# PS1='\w'$YELLOW'$(parse_git) '$NORMAL'\$ '

# <username>@<Machine Name> <Current Directory> (<Branch Name>)
# PS1='\u@\h \w $(__git_ps1 "'$YELLOW'(%s) ")'$NORMAL'\$ '

# <username>@<Machine Name> <Current Directory> (<Branch Name>) [pair]
# PS1='\u@\h \w'$YELLOW'$(parse_git) '$NORMAL'\$ '

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
