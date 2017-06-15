#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\u \W \$ '
export EDITOR='/usr/bin/vim'
TERM='rxvt-unicode-256color'

#--- ALIASES ---#

# Power 
alias poff='systemctl poweroff'
alias nap='systemctl suspend'
alias reboot='systemctl reboot'
alias lock='i3lock'

# Folders
export storage='/mnt/storage'
export mediad='/mnt/storage/Media_Dump'
export files='/mnt/storage/Files'
export media='/mnt/storage/Files/Media'
export code='/mnt/storage/Files/Code'
export games='/mnt/games'
