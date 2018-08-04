set fish_greeting ""

# Exports
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8
set -x DISPLAY ":0"
set --export EDITOR "nvim"

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

source ~/.fish_aliases
source ~/.fish_functions

#set PATH $PATH /usr/local/opt/coreutils/libexec/gnubin
#set MANPATH $MANPATH /usr/local/opt/coreutils/libexec/gnuman
set PATH $PATH /usr/local/sbin
set PATH $PATH /usr/local/bin
set PATH $PATH /usr/sbin
set PATH $PATH /usr/bin
set PATH $PATH /sbin
set PATH $PATH /bin
set PATH $PATH $HOME/bin

#stty echo
