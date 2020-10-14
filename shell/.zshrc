[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

emulate zsh -c "$(direnv export zsh)"

POWERLEVEL9K_MODE='nerdfont-complete'
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

emulate zsh -c "$(direnv hook zsh)"

# Path to your oh-my-zsh installation.
export ZSH="/home/m/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# ssh-add ~/.ssh/ata-github

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    ansible
    archlinux
    aws
    colored-man-pages
	  colorize
	  command-not-found
    conda-zsh-completion
    docker
    docker-compose
	  git-auto-fetch
    helm
    history
    history-substring-search
    per-directory-history
    kops
    kubectl
    lein
    minikube
    op
    systemd
    terraform
    vi-mode
	  web-search
    yarn
	  zsh-autosuggestions
	  zsh-interactive-cd
        )

autoload -Uz compinit && compinit
setopt COMPLETE_ALIASES
source $ZSH/oh-my-zsh.sh

source <(kubectl completion zsh)

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR=e
else
  export EDITOR=e
fi

zstyle ':completion:*' rehash true
zstyle ':completion:*:*:make:*' tag-order 'targets'

alias mkdir="mkdir -p"
alias fb="ranger"
alias webcam="mpv --demuxer-lavf-format video4linux2 --demuxer-lavf-o-set input_format=mjpeg av://v4l2:$1"
alias ssh='TERM=xterm ssh'
alias doghouse='sudo netctl-auto switch-to doghouse'
alias ata='sudo netctl-auto switch-to ATA'
alias z='zathura'
alias spotify='spotify --force-device-scale-factor=2'
alias whatsmyip='curl https://ipinfo.io/ip'
alias newqt='qutebrowser --target window'
alias less='cless'
alias rm='rm -v'
alias yacom='ccat ~/.oh-my-zsh/plugins/archlinux/README.md|grep yay'
alias q='qutebrowser'

if [ -f ~/.zsh/private-config.zsh ]; then
    source ~/.zsh/private-config.zsh
else
    print "~/.zsh/private-config.zsh not found."
fi

function clj() {
    if [[ -z $@ ]]; then
        command clojure -A:rebel
    else
        command clj $@
    fi
}

source ~/bin/kube-ps1/kube-ps1.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

PATH="/home/m/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/m/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/m/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/m/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/m/perl5"; export PERL_MM_OPT;

complete -o nospace -C /usr/bin/vault vault

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
