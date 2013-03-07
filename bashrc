#
# .bashrc - bash(1) initialization for interactive non-login shells
#

export PATH=$HOME/local/bin:$HOME/local/rubygems/bin:$HOME/bin:/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/ccs/bin:/usr/X11R6/bin
#export PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin
export MANPATH=$HOME/local/man/man1:/opt/local/man:/opt/local/share/man:/usr/local/opt/coreutils/libexec/gnuman:/usr/local/man:/usr/local/share/man:/usr/share/man
export LD_LIBRARY_PATH=$HOME/local/lib:/usr/X11R6/lib:/usr/local/lib:/usr/lib

export JAVA_HOME=$HOME/install/jdk
# pick your favorite editor
export EDITOR=vim

# pick your favorite pager
export PAGER=less

# other useful settings
export BLOCKSIZE=1k
export RCSINIT=-zLT

# pick the printer nearest you
#export PRINTER=volks
#export LPDEST=$PRINTER

umask 022

# useful bash settings
unset MAILPATH MAILCHECK
set -o notify
shopt -u hostcomplete

# useful command aliases
alias h='history 25'
alias j='jobs -l'
alias ls='ls --color=auto'
alias la='ls -a'
alias lf='ls -FA'
alias ll='ls -lA'
alias vi='vim'
alias less='less -R'
alias grep='egrep'


# fancy prompt
    _setup_prompt() {
	local pwd=${PWD/#$HOME/~}  # change /home/cedrich to ~

        local reset='\[\033[0m\]'
        local green='\[\033[0;32m\]'
        local brown='\[\033[0;33m\]'
        local blue='\[\033[1;34m\]'
        local magenta='\[\033[1;35m\]'

	let n=$COLUMNS-${#pwd}-50
	if (( $n > 0 )); then
	    local w=$pwd
        else
	    local w="...${pwd:3-n}"
        fi

	export PS1="$blue[$reset\\u@\\h:$green$w$blue]\$$reset "
    }

PROMPT_COMMAND=_setup_prompt
#unset _setup_prompt


# Check terminal size
shopt -s checkwinsize

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

# Load nvm if found in usual dir
if [ -f ~/local/nvm/nvm.sh ]; then
    . ~/local/nvm/nvm.sh
fi
if [ -f ~/local/etc/git-completion.bash ]; then
    . ~/local/etc/git-completion.bash
fi
