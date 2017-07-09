# colors for terminal
export TERM=xterm-256color

# cool bash prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "


# remove duplicates
export HISTCONTROL=ignoreboth:erasedups

# set vim as default editor
export EDITOR=vim
