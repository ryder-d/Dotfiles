# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.bash_aliases
source /usr/share/git/completion/git-prompt.sh

green=

git=`[[ $(git status 2> /dev/null) =~ Changes\ to\ be\ committed: ]] && echo "\[\e[33m\]" || echo "\[\e[31m\]"``[[ ! $(git status 2> /dev/null) =~ nothing\ to\ commit,\ working\ .+\ clean ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")

PS1='\n\[\e[1;36m\]\u\[\e[0m\]  in  \[\e[1;36m\]\w\[\e[0m\]$(__git_ps1 " on (%s)" \[$git\]) \[\e[m\] \$ '
EDITOR=/usr/bin/vim
