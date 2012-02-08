# set colors 
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
eval _$color='%{$terminfo[bold]$fg[${(L)color}]%}'
eval $color='%{$fg[${(L)color}]%}'
(( count = $count + 1 ))
done
FINISH="%{$terminfo[sgr0]%}"
RESET="%{$reset_color%}"

# set virtual env
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

#set vi mode
MODE_INDICATOR="$_RED:$RESET"
MAIN_INDICATOR="$_CYAN>$RESET"
function vi_mode_prompt() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins|.safe)/$MAIN_INDICATOR}"
}

# set mode-change prompt
function zle-line-init zle-keymap-select {
PROMPT="$_YELLOW$(virtualenv_info)$_GREEN%c $(vi_mode_prompt) $_BLUE$(git_prompt_info)% $RESET$FINISH"
  zle reset-prompt
PROMPT="$_YELLOW$(virtualenv_info)$_GREEN%c $_CYAN> $_BLUE$(git_prompt_info)% $RESET$FINISH"
}
zle -N zle-line-init
zle -N zle-keymap-select

PROMPT="$_YELLOW$(virtualenv_info)$_GREEN%c $_CYAN> $_BLUE$(git_prompt_info)% $RESET$FINISH"


ZSH_THEME_GIT_PROMPT_PREFIX="($RED"
ZSH_THEME_GIT_PROMPT_SUFFIX="$RESET"
ZSH_THEME_GIT_PROMPT_DIRTY="$BLUE) $_RED✗$RESET "
ZSH_THEME_GIT_PROMPT_CLEAN="$BLUE) $_GREEN✔$RESET "
