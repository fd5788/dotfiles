# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
#ZSH_THEME="robbyrussell"
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-prompt)

source $ZSH/oh-my-zsh.sh

## User configuration

#export PATH=/usr/local/bin:$PATH
#export MANPATH="/usr/local/man:$MANPATH"
#zsh-completions
fpath=(%ANDROID_HOME/tools /usr/local/share/zsh-completions $fpath)

##android
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:/usr/local/sbin
##golang
#gopath
export GOPATH=$HOME/workspace/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

## macports
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
#export MANPATH=/opt/local/share/man:$MANPATH
#export DISPLAY=:0.0

# homebrew for github
if [ -f /usr/local/bin/brew ]; then
    export HOMEBREW_GITHUB_API_TOKEN=7e14f6b8d43cce08d2a0b6dc043cfcf4d34ebd9c
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# load autojump
#osx
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

#if [[ -n $SSH_CONNECTION ]]; then
#    if [ -f /usr/share/autojump/autojump.sh ]; then
#        . /usr/share/autojump/autojump.sh
#    fi
#else
#    if [ -f /usr/local/share/autojump/autojump.sh ]; then
#        . /usr/local/share/autojump/autojump.sh
#    fi
#fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
##alias {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
#alias ls='ls -F --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias lh='ls -hAl'
alias l='ls -CF'
#alias grep='grep --color=auto'
alias trash='trash-put'
##}}}
