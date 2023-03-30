export EDITOR='nvim'
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export FILE='lf'
export BROWSER="qutebrowser"
export READER="zathura"

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin:" ] ;
  then PATH="$HOME/.cargo/bin:$PATH"
fi
