# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.bash_aliases

PS1='\u \W \$ '
EDITOR=/usr/bin/vim
