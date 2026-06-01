# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
precmd() {
	PROMPT="%F{cyan}%1~%f %F{green}$(git_branch_name)%f → "
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export TROVO_ENV=docker
alias trovo="/Users/ignacioromanherrera/trovo/trovo"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/ignacioromanherrera/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "/Users/ignacioromanherrera/.bun/_bun" ] && source "/Users/ignacioromanherrera/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Navigate words
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
