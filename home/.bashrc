#
# .bashrc - bash(1) initialization for interactive non-login shells
#

# PATH
PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:$PATH
PATH=/opt/homebrew/bin:$HOME/.brew/bin:$PATH
PATH=/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH
PATH=/opt/homebrew/opt/findutils/libexec/gnubin:$PATH
PATH=$HOME/local/bin:$HOME/bin:$PATH
export PATH

export MANPATH=$HOME/local/man/man1:$HOME/local/opt/coreutils/libexec/gnuman:/opt/local/man:/opt/local/share/man:/usr/local/opt/coreutils/libexec/gnuman:/usr/local/man:/usr/local/share/man:/usr/share/man
export LD_LIBRARY_PATH=$HOME/local/lib:/usr/X11R6/lib:/usr/local/lib:/usr/lib

# pick your favorite editor
export EDITOR=vim

# pick your favorite pager
export PAGER=less

# other useful settings
export BLOCKSIZE=1k

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
    local pwd=${PWD/$HOME/\~}  # change /home/cedrich to ~
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

    export PS1="$brown[$reset\D{%T}$brown]$blue[$reset\\u@\\h:$green$w$blue]\$$reset "
}

PROMPT_COMMAND=_setup_prompt


# Check terminal size
shopt -s checkwinsize

# Bash completions
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi
if [ -f $HOME/.brew/share/bash-completion/bash_completion ]; then
    . $HOME/.brew//share/bash-completion/bash_completion
fi
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Git completion
if [ -f ~/local/etc/git-completion.bash ]; then
    . ~/local/etc/git-completion.bash
fi

# Local overrides
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

