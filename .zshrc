# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setup the prompt
autoload -Uz promptinit
promptinit
prompt walters

# Completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias cat='bat'
alias help='bat ~/.zshrc | grep alias | sed -e "s/alias//g"'

# Volume
alias volumeup='pactl set-sink-volume 0 +5%'
alias volumedown='pactl set-sink-volume 0 -5%'
alias mute='pactl set-sink-mute 0 false'
alias unmute='pactl set-sink-mute 0 true'

# Quick navigation
alias repos='cd /home/n/Desktop/n/repos'

# GIT
alias gl='f()(git log --oneline --all --graph --decorate  $*);f'
alias diff='f()(git log --no-merges --pretty=format:"%Cgreen%h %Creset>> %s << %as, %ar %Cred(%an, %ae)" $1);f'
alias diffc='f()(git log --no-merges --pretty=format:"%Cgreen%h %Creset>> %s << %as, %ar %Cred(%an, %ae)" --ancestry-path $1);f'

# K8S
alias azlogin='az login --use-device-code'
alias k='f()(kubectl $*);f'
alias kpods='kubectl get pods'
alias klogs='f()(kubectl logs -f $1);f'
alias kns='kubectl get namespaces'
alias kds='kubectl get deployments'
alias kss='kubectl get services'
alias kdevsub='az account set --subscription GA12_Sub_Telematics_Spoke_DEV'
alias kqasub='az account set --subscription GA13_Sub_Telematics_Spoke_QA'
alias kprodsub='az account set --subscription GA14_Sub_Telematics_Spoke_PROD'
alias kdev1group='az aks get-credentials --resource-group rg-dceb-telc-dev1-cus --name aks-dceb-telc-dev1-cus'
alias kdev2group='az aks get-credentials --resource-group rg-dceb-telc-dev2-eus2 --name aks-dceb-telc-dev2-eus2'
alias kqa1group='az aks get-credentials --resource-group rg-dceb-telc-qa1-cus  --name aks-dceb-telc-qa1-cus'
alias kqa2group='az aks get-credentials --resource-group rg-dceb-telc-qa2-eus2  --name aks-dceb-telc-qa2-eus2'
alias kprod1group='az aks get-credentials --resource-group rg-dceb-telc-prod1-cus  --name aks-dceb-telc-prod1-cus'
alias kprod2group='az aks get-credentials --resource-group rg-dceb-telc-prod2-eus2  --name aks-dceb-telc-prod2-eus2'
alias knsswitch='f()(kubectl config set-context --current --namespace=$1);f'
alias kevents='kubectl -n entitybroker get events --sort-by="{.lastTimestamp}"'

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
