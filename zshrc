export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="awesomepanda"

plugins=(git tmux fzf autojump)

source $ZSH/oh-my-zsh.sh

# Java configurations
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven

# PATH extensions ...
export PATH=/opt/nvim-linux64/bin:$PATH
export PATH=/home/sschmid/.cargo/bin:$PATH
export PATH=${M2_HOME}/bin:${PATH}
export PATH=/usr/local/go/bin:${PATH}

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias lg="lazygit"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "/home/sschmid/.ghcup/env" ] && source "/home/sschmid/.ghcup/env" # ghcup-env
