# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export ZSH_DISABLE_COMPFIX=false

# Path to your oh-my-zsh installation.
export ZSH="/Users/chris/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Plugins list
plugins=(git macos zsh-autosuggestions dotenv zsh-syntax-highlighting)

# Initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
alias gch="git checkout"
alias gs="git status"
alias gpl="git pull"
alias pip="pip3"
alias python="python3"
alias rc="bin/rails console"
alias rc="rails c"
alias rubodiff="git fetch && git diff-tree -r --no-commit-id --name-only master@\{u\} head | xargs ls -1 2>/dev/null | xargs rubocop --force-exclusion -A"

# GPG Agent
if [[ ! -S ~/.gnupg/S.gpg-agent && ! -n "$(pgrep gpg-agent)" ]]; then
  eval $(eval $(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf))
fi

# Initialize nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Define load-nvmrc function
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc

# Environment settings
export REDIS_URL='redis://127.0.0.1:6379'

# GDK bootstrap additions
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:${PKG_CONFIG_PATH}"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1 --with-readline-dir=/usr/local/opt/readline"

# Brew configuration
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

# Java and other paths
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-16.0.1.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
eval "$(direnv hook zsh)"
export NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
export PATH=/usr/local/opt/imagemagick@6/bin:$PATH;

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# OpenSSL 1.1
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# Editor settings
export EDITOR='vi'
load-nvmrc