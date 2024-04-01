# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="codespaces"

plugins=(git kubectl git-auto-fetch git-extras tmux fzf autojump)

source $ZSH/oh-my-zsh.sh

# Java configurations
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven

# Example aliases
alias vim="nvim"
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias lg="lazygit"
alias c="clear"

DISABLE_AUTO_UPDATE=true
DISABLE_UPDATE_PROMPT=true

export KUBE_EDITOR='code --wait'

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH