# Carregar prompt instantâneo do powerlevel10k, se disponível
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Carregar variáveis de ambiente personalizadas
source /etc/profile.d/myvar.sh
export DEVELOPMENT="${HOME}/projects/"

# Aliases úteis
alias dev='cd $DEVELOPMENT'
alias r='rm -rf '
alias c='clear'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias la='ls -lha'
alias ll='ls -lh'
alias lk='ls -lh | awk '"'"'{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf("%0o ",k);print}'"'"''

# Aliases para Docker
alias logs='docker ps -q | xargs -L 1 -P `docker ps | wc -l` docker logs --since 30s -f'
alias dps='docker ps'
alias dk='docker kill '

# Aliases para Git
alias gall='git add --all'
alias gs='git status -s'
alias gp='git pull'
alias gph='git push'
alias gd='git diff | mate'
alias gau='git add --update'
alias gc='git commit -m'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'
alias gfo='git fetch origin'

# Configuração do PATH
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Configuração do Zsh e Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  sudo
  aws
  bgnotify
  docker
  systemd
  npm
  nvm
  docker-compose
  git
  gradle
  history
  node
  jsontools
  copyfile
  copybuffer
  dirhistory
  fzf
)

source $ZSH/oh-my-zsh.sh

# Plugins adicionais do Oh My Zsh
source $HOME/.oh-my-zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.oh-my-zsh/zsh-completions/zsh-completions.plugin.zsh

# Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Instalação e configuração do Zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-history-substring-search \
    zsh-users/zsh-completions \
    buonomo/yarn-completion \
    zdharma-continuum/zinit-annex-readurl \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
    zdharma-continuum/fast-syntax-highlighting \
    junegunn/fzf

# Carregar nvm
source ~/.nvm/nvm.sh

# Configuração de cache para autocompletar
ZSH_COMPDUMP="${HOME}/.cache/.zcompdump-${ZSH_VERSION}"
