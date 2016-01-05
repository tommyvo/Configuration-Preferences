alias "ls"="ls -al"
alias "lsl"="ls -l"
alias "cls"="clear"
alias "dir"="ls"
alias "shutter"="killall PTPCamera ; gphoto2 --get-config /main/status/shuttercounter"
alias "ll"="ls"

# Enable colors, and set the colors
export CLICOLOR=1

export PATH=/usr/local/bin:$PATH

# Colorized Git branch
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
NORMAL="\[\e[0m\]"
YELLOW="\[\e[0;33m\]"
PS1='\u@\h \w $(__git_ps1 "'$YELLOW'(%s) ")'$NORMAL'\$ '

# Git Auto-Complete (bash-completion via brew)
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

ulimit -n 4096

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
