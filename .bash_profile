alias "ls"="ls -al"
alias "lsl"="ls -l"
alias "cls"="clear"
alias "dir"="ls"
alias "shutter"="killall PTPCamera ; gphoto2 --get-config /main/status/shuttercounter"

# Enable colors, and set the colors
export CLICOLOR=1

export PATH=/usr/local/bin:$PATH

# Colorized Git branch
source ~/.git-prompt.sh
PS1='\h:\W \u$(__git_ps1 " \[\033[0;33m\](%s)\[\033[0m\]")\$ '

# Git Auto-Complete
# if [ -f ~/.git-completion.bash ]; then
#   . ~/.git-completion.bash
# fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
