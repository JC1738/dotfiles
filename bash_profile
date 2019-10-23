if [ -r ~/.bashrc ]; then
   source ~/.bashrc
fi

export PATH=$PATH:~/.kube/plugins/jordanwilson230
export HOMEBREW_GITHUB_API_TOKEN=005996ee979e70e6c47e524950376420805f387d
export PATH="/usr/local/opt/go@1.11/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
