# Color of prompt
PROMPT="%F{198}[%f%F{51}%n %f%F{201}%~%f%F{198}]$ %f"

# ZSH
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
export HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

# Pyenv
eval "$(pyenv init -)"

# Aliases
source $HOME/.config/zsh_aliases

# Variables
source $HOME/.config/variables/work.variables
source $HOME/.config/variables/private.variables