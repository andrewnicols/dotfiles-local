# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
#
# .zprofile is basically the same as .zlogin except that it's sourced
# before .zshrc while .zlogin is sourced after .zshrc. According to the
# zsh documentation, ".zprofile is meant as an alternative to .zlogin
# for ksh fans; the two are not intended to be used together, although
# this could certainly be done if desired."
#
# The ultimate order is:
# → .zshenv
# → [.zprofile if login]
# → [.zshrc if interactive]
# → [.zlogin if login]
# → [.zlogout sometimes].


################################################
# API Tokens
################################################

[[ -f ~/.zsecrets ]] && source ~/.zsecrets

################################################
# Aliases
################################################

alias git='hub'
alias gl="git log"

################################################
# Niceties
################################################
export LESSOPEN="|/opt/homebrew/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

################################################
# MDK
################################################
if [ -f "$HOME/git/ext/mdk/extra/goto_instance" ]
then
  . "$HOME/git/ext/mdk/extra/goto_instance"
fi

