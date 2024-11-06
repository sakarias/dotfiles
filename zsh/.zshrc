[[ -f /usr/local/bin/nvim || -f /opt/homebrew/bin/nvim ]] && alias vim=nvim
[[ -f /usr/local/bin/bat ]] && alias cat='bat -A'

if [[ -f /usr/local/bin/zoxide || -f /opt/homebrew/bin/zoxide ]] 
then
  eval "$(zoxide init zsh)"
  alias cd=z
fi

if [[ -f /usr/local/bin/fuck ]] 
then
  eval "$(thefuck --alias)"
  alias ff=fuck
  alias ffs=fuck
fi

if [[ -f /usr/local/bin/eza ]] 
then
  alias ls='eza --icons'
  alias l='eza -lbF --git --icons'
  alias ll='eza -lbGF --git --icons'
  alias llm='eza -lbGd --git --sort=modified'
  alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale --icons'
  alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'

  # specialty views
  alias lS='eza -1 --icons'
  alias lt='eza --tree --level=2 --icons'
  alias l.="eza -a | grep -E '^\.'"
fi

HISTFILE=${HOME}/.zsh_history
SAVEHIST=1000
HISTSIZE=999
export PATH="${HOME}/.bin:/usr/local/sbin:${PATH}"

setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Activate syntax highlighting
source .zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
# Change colors
# export ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue
# export ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue
# export ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

# Activate autosuggestions
source .zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-window-title/zsh-window-title.zsh
source ~/.zsh/zsh-ssh/zsh-ssh.zsh
source ~/.config/fzf-git.sh

eval "$(starship init zsh)"

#case $- in *i*)
#  if [ -z "$TMUX" ]
#  then 
#    exec tmux
#  fi
#  ;;
#esac
