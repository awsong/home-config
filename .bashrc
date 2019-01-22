# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export PATH=$PATH:/opt/local/bin
export MANPATH=$MANPATH:/opt/local/man

# Define some colors first:
RED='\[\e[1;31m\]'
GREEN='\[\e[1;32m\]'
YELLOW='\[\e[1;33m\]'
BLUE='\[\e[1;34m\]'
CYAN='\[\e[1;36m\]'
MAGENTA='\[\e[1;35m\]'
#NC='\[\e[0m\]' # No Color
NC='\[\033[0m\]'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=50000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm*|rxvt*|putty*|screen*) color_prompt=yes;;
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

if [ 0 == `id -u` ] 
then
    USR_COLOR=${RED}
    HOST_COLOR=${GREEN}
else
    USR_COLOR=${GREEN}
    HOST_COLOR=${YELLOW}
fi
if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}${USR_COLOR}\u${HOST_COLOR}@\h${NC}: ${BLUE}\w${NC} ${MAGENTA}\\$ ${NC}"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
#unset color_prompt force_color_prompt

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
    alias ls='ls --color=auto -F'
else #Mac OS X
    alias ls='ls -G -F'
fi

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_so=$'\E[32;246m'      # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 4; tput setab 7) # blue on white
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 5) # magenta
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)

export EDITOR=vim
export LC_ALL=en_US.UTF-8
export GOPATH=$HOME/go
export HISTTIMEFORMAT="%d/%m/%y %T "
alias ll='ls -l'
alias la='ls -a'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias home='ssh -D8086 -p10828 wsong@home1.3fire.org'
alias usa='ssh -D8087 root@neo.3fire.org'
alias hk='ssh root@i.3fire.org'
alias ubuntu='ssh uf8bc12a029f054051fb6.ant.amazon.com'
alias rh='ssh andysong.desktop.amazon.com'
alias ec2='ssh -D8088 ec2-user@ec2-54-92-26-121.ap-northeast-1.compute.amazonaws.com'
export HOMEBREW_GITHUB_API_TOKEN=7782bec5f23f689a3d48d5517e9d2f51984bea9a

if [ "Darwin" == `uname` ]; then
    export TERM_PROFILE=`osascript ~/bin/vim.scpt`
    case "${TERM_PROFILE}" in
	Chalk)
	    export VIM_COLOR=kolor
	    ;;
	*)
	    export VIM_COLOR=default
	    ;;
    esac
fi
if [ "$color_prompt" = yes ]; then
    export VIM_COLOR=kolor
fi
