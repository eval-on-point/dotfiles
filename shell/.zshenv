typeset -U PATH path
path=("$HOME/bin" "$HOME/.node_modules/bin" "$HOME/.local/bin" "$(ruby -e 'puts Gem.user_dir')/bin" "$path[@]")
export PATH

export npm_config_prefix=~/.node_modules

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export QT_AUTO_SCREEN_SCALE_FACTOR=1

export RUST_SRC_PATH=/usr/bin/racer

export SSH_ASKPASS=ssh-askpass

export FZF_BASE=/usr/bin/fzf

export FZF_DEFAULT_COMMAND='fd --type file --color=always --follow --hidden'

# Solarized colors
export FZF_DEFAULT_OPTS='
  --ansi
  --height=100%
  --reverse
  --color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#586e75
  --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
  --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
  --bind ctrl-f:preview-page-down,ctrl-b:preview-page-up
  --bind ctrl-j:preview-down,ctrl-k:preview-up
'
