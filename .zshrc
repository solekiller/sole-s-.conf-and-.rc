# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git \
kubectl \
autoswitch_virtualenv
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(pyenv init --path)"
export DAGSTER_HOME="${HOME}"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

function login_to_acr {
	TOKEN=$(az acr login --name discoverycommon.azurecr.io --expose-token --output tsv --query accessToken);
	docker login discoverycommon.azurecr.io --username 00000000-0000-0000-0000-000000000000 --password-stdin <<< $TOKEN;
}
 
function upload_pip_package {
  python3 setup.py sdist upload -r local
}
function zlib_cat {
 local filename=$1;
 cat $filename |zlib-flate -uncompress
}
function list_blob_names {
	local account=$1;
        local container=$2;
	if [ -z $account ];then
           echo "missing account";
	   return 1;
	fi
        if [ -z $container ];then
          echo "missing container";
          echo "./$0 account container";
          return 1;
        fi
	az storage blob list --auth-mode login --account-name $account --container-name $container |jq '.[].name'
}
function download_blob {
	local account=$1;
	local container=$2;
	local remote_blob=$3;
	local local_file=$4;

        az storage blob download --container-name $container --account-name $account --name "$remote_blob" --file "$local_file" --auth-mode login
}
alias vim="nvim"

export PATH=/Users/jacob.kilimnik/.groundcover/bin:${PATH}
alias brain='ssh brain@br.hpov.me'
alias corpdis='ssh azureuser@52.170.112.184'
alias dev_discovery='ssh azureuser@dev.discovery.hpov.me'
alias local_brain='ssh brain@st-br.hpov.me'
alias logs='ssh azureuser@discovery-logs.hpov.me'
alias old_shadow='ssh -p 1745 batman@shadow.hpov.me'
alias portscan='ssh -p 19238 porti@34.75.163.155'
alias prod_shadow='ssh batman@prod.shadow.hpov.me'
alias sdfinder='ssh azureuser@sd-finder.hpov.me'
alias test_discovery='ssh azureuser@test.discovery.hpov.me'
alias test_machine='ssh azureuser@40.117.93.218'
alias test_shadow='ssh batman@test.shadow.hpov.me'
alias test_verifier='ssh azureuser@20.25.11.69'
alias verifier='ssh azureuser@40.88.12.202'
