# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac



# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# ----------------------------- custom part ----------------------------
# customize prompt color
export PS1="\[\033[00;38;5;100m\]\u\[\033[00;38;5;101m\]@\[\033[00;38;5;106m\]\h\[\033[00;38;5;106m\]:\[\033[00;38;5;70m\]\w\[\033[00;38;5;72m\]$ \[\033[00;38;5;253m\]"

# language
#export LC_CTYPE=zh_CN.UTF-8
#export LC_LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# dirr custom ls tool
export PATH="$HOME/.bin:$PATH"
alias ls='dirr'
alias ll='dirr -al'

# xterm
alias xterm="xterm -fn -misc-fixed-bold-r-normal--15------iso8859-15 -fg gray -bg black"
alias xterm30="xterm -fn -misc-fixed-bold-r-normal--30------iso8859-15 -fg gray -bg black"
alias xtermb="xterm -fn -misc-fixed-bold-r-*-*-30-280-75-75-*-*-iso10646-1 -fg gray -bg black"

# tmux
alias tmux='tmux -2'

# system
alias vi='vim'
alias svim='sudo vim'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias update='sudo apt-get update; sudo apt-get upgrade'
alias ..="cd .."
alias ...="cd ..; cd .."
alias mkcd=mkcd
mkcd(){ mkdir -p "$1"; cd "$1"; }

# shared history between different sessions, such as bash\tmux pane etc.
USER_IP=`who -u am i 2>/dev/null| awk '{print $NF}'|sed -e 's/[()]//g'` 
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S  `whoami`@${USER_IP}: "
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000000
export HISTFILESIZE=1000000
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend

# enable ctrl+s back default:ctrl+r next
stty -ixon 

# custom rm command, can recovery
# not work well, deprecated!!!
# alias rm=trash
# alias r=trash
# alias rl='ls ~/.trash'
# alias ur=undelfile

# undelfile()
# {
  # mv -i ~/.trash/$@ ./
# }

# trash()
# {
  # if [ -d ~/.trash/$@ ]; then
        # /bin/rm -rf ~/.trash/$@
  # fi
  # if [ -f ~/.trash/$@ ]; then
        # /bin/rm -f ~/.trash/$@
  # fi
  # mv -f $@ ~/.trash/$@
# }

# cleartrash()
# {
    # read -p "clear sure?[n]" confirm
    # [ $confirm == 'y' ] || [ $confirm == 'Y' ] && /bin/rm -rf ~/.trash/*
# }

## ------------third party apps config-----------------
# autojump: j foo
# [[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

# z.lua a better cd command than autojump
export _ZL_ECHO=1 # z.lua print the new directory after cd
# eval "$(lua /path/to/z.lua --init bash enhanced once)"
eval "$(lua $HOME/enhancetools/z.lua/z.lua --init bash enhanced once fzf)" # tab enable fzf



# fzf replace ctrl+r
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
## python virtualenvwrapper config
# if [ `id -u` != '0' ]; then
    # #export VIRTUALENV_USE_DISTRIBUTE=1        # <-- Always use pip/distribute
    # export WORKON_HOME=$HOME/.virtualenvs       # <-- Where all virtualenvs will b#
    # export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    ## source /usr/local/python3/bin/virtualenvwrapper.sh
    # source /usr/local/bin/virtualenvwrapper.sh
    # #export PIP_VIRTUALENV_BASE=$WORKON_HOME
    # #export PIP_RESPECT_VIRTUALENV=true
# fi

## pyenv config
## Load pyenv automatically by adding
# export PATH=$HOME/.pyenv/bin:$PATH
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"


