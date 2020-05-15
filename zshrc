# If you come from bash you might have to change your $PATH.
# export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="sorin"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-prompt kube-ps1 kubectl helm fzf node bundler osx rake ruby python golang tmux vi-mode zsh-navigation-tools fancy-ctrl-z zsh_reload)

source $ZSH/oh-my-zsh.sh

# User configuration

# FIND ALL
function p(){
        ps aux | grep -i $1 | grep -v grep
}

# KILL ALL
function ka(){

    cnt=$( p $1 | wc -l)  # total count of processes found
    klevel=${2:-15}       # kill level, defaults to 15 if argument 2 is empty

    echo -e "\nSearching for '$1' -- Found" $cnt "Running Processes .. "
    p $1

    echo -e '\nTerminating' $cnt 'processes .. '

    ps aux  |  grep -i $1 |  grep -v grep   | awk '{print $2}' | xargs sudo kill -$klevel
    echo -e "Done!\n"

    echo "Running search again:"
    p "$1"
    echo -e "\n"
}


echo "$(uname)"

if [ "$(uname)" = "Darwin" ]; then
    # Do something under Mac OS X platform
		export MYOS=Mac

		files=(bashrc_mac)
		pathof="$HOME/Documents/git/dotfiles/mac/"
		for file in ${files[@]}
		do
			file_to_load=$pathof$file
			if [ -f "$file_to_load" ];
			then
        . $file_to_load
        echo "loaded $file_to_load"
			fi
		done


elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    # Do something under GNU/Linux platform
		export MYOS=Linux

		files=(bashrc_linux)
		pathof="$HOME/Documents/git/dotfiles/linux/"
		for file in ${files[@]}
		do
			file_to_load=$pathof$file
			if [ -f "$file_to_load" ];
			then
        . $file_to_load
        echo "loaded $file_to_load"
			fi
		done

fi


# Stick private information in private repo
files=(bashrc_private)
pathof="$HOME/Documents/git/dotfiles_private/"
for file in ${files[@]}
do
    file_to_load=$pathof$file
    if [ -f "$file_to_load" ];
    then
        #. $file_to_load
        [[ -e $file_to_load ]] && emulate sh -c 'source $file_to_load'
        echo "loaded $file_to_load"
    fi
done


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



yp () {
       ypmatch $1 passwd.byname
}

ip () {
        WHOIS=$(whois $1)
        echo "IPAddress: $1/32" | grep 'IPAddress' && echo $WHOIS | grep 'OrgName' || true && echo $WHOIS | grep 'CIDR' && echo $WHOIS | grep 'Customer' || true && echo $WHOIS | grep 'Organization' || true && echo $WHOIS | grep 'OrgTechName' || true \
       && echo $WHOIS | grep 'country' || true && echo $WHOIS | grep 'inetnum' || true
}

batdiff () {
    git diff --name-only --diff-filter=d 2>/dev/null | xargs bat --diff
}


export HELM_HOME=$HOME/Documents/git/dotfiles/config/helm_plugins
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export PATH="$PATH:/usr/local/opt/llvm/bin"
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/Documents/git/diff-so-fancy"
export PATH="$PATH:$HOME/.kube/plugins/jordanwilson230"

source "$HOME/google-cloud-sdk/path.zsh.inc"
source "$HOME/google-cloud-sdk/completion.zsh.inc"

# FZF
export FZF_BASE=$HOME/.fzf/bin/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
export PATH="$PATH:$HOME/.rvm/bin"

# kubeoff by default, turn on by kubeon
PROMPT=$PROMPT'$(kube_ps1) '
KUBE_PS1_ENABLED=off
