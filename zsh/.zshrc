HOMEBREW_NO_ENV_HINTS=0

[[ -f /usr/local/bin/nvim || -f /usr/bin/nvim || -f /opt/homebrew/bin/nvim ]] && alias vim=nvim
[[ -f /usr/local/bin/bat ]] && alias cat='bat'
[[ -f /usr/bin/batcat ]] && alias cat='batcat'

if [[ -f /usr/local/bin/zoxide || -f /usr/bin/zoxide || -f /opt/homebrew/bin/zoxide ]] 
then
  eval "$(zoxide init zsh)"
  alias cd=z
fi

if [[ -f /usr/local/bin/fuck || -f /usr/bin/thefuck ]] 
then
  eval "$(thefuck --alias)"
  alias ff=fuck
  alias ffs=fuck
fi

if [[ -f /usr/local/bin/eza || -f /usr/bin/eza ]] 
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

# Locale settings
export LANG="en_US.UTF-8" # Sets default locale for all categories
export LC_ALL="en_US.UTF-8" # Overrides all other locale settings
export LC_CTYPE="en_US.UTF-8" # Controls character classification and case conversion

export SAVEHIST=10000000
export HISTFILE=${HOME}/.zsh_history
export HISTFILESIZE=${SAVEHIST}
export HISTSIZE=${SAVEHIST}
export HIST_STAMPS="yyyy-dd-mm"
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S] "
export PATH="${HOME}/.bin:/usr/local/sbin:/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.3.0/bin:${PATH}"

#setopt share_history
#setopt hist_expire_dups_first
#setopt hist_ignore_dups
#setopt hist_verify

# HISTORY
setopt EXTENDED_HISTORY         # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST   # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS        # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS     # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS         # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE        # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS        # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY            # Share history between all sessions.
setopt HIST_VERIFY
setopt APPENDHISTORY            # ensures that each command entered in the current session is appended to the history file immediately after execution
setopt INC_APPEND_HISTORY       # history file is updated immediately after a command is entered
# END HISTORY

# Activate syntax highlighting
if [ -f "~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]
then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  # Disable underline
  (( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
  ZSH_HIGHLIGHT_STYLES[path]=none
  ZSH_HIGHLIGHT_STYLES[path_prefix]=none
  # Change colors
  # export ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue
  # export ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue
  # export ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue
fi

# Activate autosuggestions
[[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ -f /usr/bin/fzf ]
then
  source <(fzf --zsh)
  source ~/.config/fzf-git.sh
fi

#source /usr/local/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
[[ -f ~/.zsh/zsh-window-title/zsh-window-title.zsh ]] && source ~/.zsh/zsh-window-title/zsh-window-title.zsh
[[ -f ~/.ssh/config ]] && source ~/.zsh/zsh-ssh/zsh-ssh.zsh

if [ -f /usr/local/bin/starship]
then
  export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
  eval "$(starship init zsh)"
fi

