[[ -f /usr/local/bin/nvim || -f /opt/homebrew/bin/nvim ]] && alias vim=nvim
[[ -f /usr/local/bin/bat ]] && alias cat=bat

if [[ -f /usr/local/bin/zoxide || -f /opt/homebrew/bin/zoxide ]] 
then
  eval "$(zoxide init zsh)"
  alias cd=z

  alias ls='eza --icons'
  alias l='eza -lbF --git'
  alias ll='eza -lbGF --git'
  alias llm='eza -lbGd --git --sort=modified'
  alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'
  alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'

  # specialty views
  alias lS='eza -1'
  alias lt='eza --tree --level=2'
  alias l.="eza -a | grep -E '^\.'"
fi

HISTFILE=${HOME}/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify


source ~/.zsh/zsh-ssh/zsh-ssh.zsh
eval "$(starship init zsh)"
