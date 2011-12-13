# autoload omz
# zstyle :omz:style theme default
# plugins=(archlinux sprunge git)
# omz init


bindkey -v

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rykka"
plugins=(git archlinux django github)
source $ZSH/oh-my-zsh.sh
#
#######################################################################
#             Customization by User
#######################################################################
backward-delete-to-slash () {
  local WORDCHARS=${WORDCHARS//\//}
  zle .backward-delete-word
}
zle -N backward-delete-to-slash
bindkey '^[w' backward-delete-to-slash
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
bindkey -v
bindkey '^E' end-of-line
bindkey '^A' beginning-of-line

bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char
bindkey "^U" kill-line  

bindkey "^X" vi-cmd-mode  
 
##在命令前插入 sudo {{{
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
    zle end-of-line                 #光标移动到行末
}
zle -N sudo-command-line
bindkey "^s^s" sudo-command-line
#}}}
  
proxy-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    [[ $BUFFER != proxychains\ * ]] && BUFFER="proxychains $BUFFER"
    zle end-of-line                 #光标移动到行末
}
zle -N proxy-command-line
bindkey "^p^p" proxy-command-line
#
alias -g cp='cp -i'
alias -g mv='mv -i'
alias -g rm='rm -i'
alias -g ls='ls -F --color=auto'
alias -g ll='ls -l'
alias -g grep='grep --color=auto'
alias -g ee='emacsclient -t'
alias -g psg='ps aux | grep --color=auto'
alias -g ssh1='sh -c ~/Documents/Scripts/sshgfw.sh'
alias -g ssh2='sh -c ~/Documents/Scripts/sshgfw2.sh'
alias -g lsg='ls -a | grep --color=auto'
alias -g gvim='gvim --remote-tab'
alias -g dj='python2 manage.py'
export EDITOR='vim'
stty -ixon

# . ~/.scripts/django_bash_completion
# vim:filetype=zsh foldmethod=marker autoindent expandtab shiftwidth=4 
