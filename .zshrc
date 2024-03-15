export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eastwood"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
)

source $ZSH/oh-my-zsh.sh

# Scripts
. "$HOME/scripts"


# Binds
set -o vi
bindkey -s ^o ". ~/scripts/search_programming.sh\n"
bindkey -s ^s "~/scripts/cht.sh\n"

# Path
export EDITOR='nvim'
export GOPATH=$HOME/go
export XDG_SCREENSHOTS_DIR=$HOME/Screenshots
export DOCKER_BUILDKIT=1

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
PATH=~/.local/share:$PATH
PATH=$GOPATH/bin:$PATH

if [ -n "$PATH" ]; then
  old_PATH=$PATH:; PATH=
  while [ -n "$old_PATH" ]; do
    x=${old_PATH%%:*}       # the first remaining entry
    case $PATH: in
      *:"$x":*) ;;          # already there
      *) PATH=$PATH:$x;;    # not there yet
    esac
    old_PATH=${old_PATH#*:}
  done
  PATH=${PATH#:}
  unset old_PATH x
fi



#Start Hyprland
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then 
  exec Hyprland
fi

