#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# PS1='\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# export PS1='\e[01;36m\u@\h\e[00m:\e[01;34m\w\e[00m\$ '

# really nice prompt
function set_bash_prompt {
    [ $? -ne 0 ] && color='\e[41;30m ($?)' || color='\e[46;30m'
    export PS1="\e[0;29m \t $color \u@\h \e[0;30;44m \w \e[0m\n\$ "
}

export PROMPT_COMMAND=set_bash_prompt

if [ -d  "/home/$USER/.local/sh" ]; then
    case "$PATH" in
        */home/$USER/.local/sh*) ;;
        *)
            export PATH="/home/$USER/.local/sh:$PATH"
            ;;
    esac
fi

# enable bash completion in interactive shells
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

export DISPLAY=$(awk '/nameserver/{print $2 ":0.0"; exit;}' /etc/resolv.conf)

# color support for good commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# handy ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# more aliases
alias explorer="explorer.sh"
alias mff-connect="ssh kleplj@u-pl7.ms.mff.cuni.cz"
