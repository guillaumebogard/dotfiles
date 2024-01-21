# .bashrc configuration

# Exit if not running interactively
[[ $- != *i* ]] && return

# Customized prompt with Git branch, exit status, and exit code
__prompt_command() {
    local EXIT="$?"             # This needs to be first
    local use_color=false

    # Check if terminal supports color
    if [ -t 1 ] && [ $(tput colors) -gt 0 ]; then
        use_color=true
    fi

    PS1=""
    if $use_color ; then
        local RCol='\[\e[0m\]'
        local Red='\[\e[0;31m\]'
        local Gre='\[\e[0;32m\]'
        local BYel='\[\e[1;33m\]'
        local BBlu='\[\e[1;34m\]'

        if [ $EXIT != 0 ]; then
            PS1+="${Red}\u${RCol}"      # Add red if exit code non 0
        else
            PS1+="${Gre}\u${RCol}"
        fi
        branch=$(git branch 2> /dev/null | grep '^*' | colrm 1 2)
        PS1+=" [${EXIT}] ${BYel}\W ${BBlu}(${branch}) ${RCol}>> "
    else
        # Fallback for no color support
        if [[ ${EUID} == 0 ]] ; then
            PS1='\u@\h \W \$ '
        else
            PS1='\u@\h \w \$ '
        fi
    fi
}

PROMPT_COMMAND=__prompt_command

# Basic aliases
alias ls='ls --color=auto'  # Colorize the ls output
alias grep='grep --colour=auto'  # Colorize grep output

# Color setup for ls using dircolors
if type -P dircolors >/dev/null; then
    # Apply user-specific color configuration if available
    [[ -f ~/.dir_colors ]] && eval $(dircolors -b ~/.dir_colors)
    # Otherwise, apply system-wide configuration
    [[ -f /etc/DIR_COLORS ]] && eval $(dircolors -b /etc/DIR_COLORS)
fi

# Bash options for better usability
shopt -s checkwinsize  # Update window size after each command
shopt -s histappend    # Append to the history file, don't overwrite it

export BROWSER=wslview  # Set default browser for WSL
export PATH="$HOME/.ghcup/bin:$PATH" # Add ghcup binaries to PATH
