# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files sourced from it.
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'no'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'pc'

# Start tmux if not already in tmux.
zstyle ':z4h:' start-tmux       command tmux -u new -A -D -t z4h

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'no'

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'no'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# SSH when connecting to these hosts.
zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
# The default value if none of the overrides above match the hostname.
zstyle ':z4h:ssh:*'                   enable 'no'

# Send these files over to the remote host when connecting over SSH to the
# enabled hosts.
zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
z4h install ohmyzsh/ohmyzsh || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Extend PATH.
path=(~/bin $path)

# Export environment variables.
export GPG_TTY=$TTY

# Source additional local files if they exist.
z4h source ~/.env.zsh

# Use additional Git repositories pulled in with `z4h install`.
#
# This is just an example that you should delete. It does nothing useful.
z4h source ohmyzsh/ohmyzsh/lib/diagnostics.zsh  # source an individual file
z4h load   ohmyzsh/ohmyzsh/plugins/emoji-clock  # load a plugin

# Define key bindings.
z4h bindkey z4h-backward-kill-word  Ctrl+Backspace     Ctrl+H
z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace

z4h bindkey undo Ctrl+/ Shift+Tab  # undo the last command line change
z4h bindkey redo Alt+/             # redo the last undone command line change

z4h bindkey z4h-cd-back    Alt+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Alt+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Alt+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Alt+Down   # cd into a child directory

# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# Define aliases.
alias tree='tree -a -I .git'

# Add flags to existing aliases.
alias ls="${aliases[ls]:-ls} -A"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

export PATH=$PATH:/usr/local/go/bin
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
export EDITOR=lvim
export PATH=~/SDKs/flutter/bin:$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"
export GOPATH=$HOME/go
export PATH=/opt/lampp/bin/:$PATH
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:~/go/bin
export PATH="$HOME/.cargo/bin:$PATH"
export KUBECONFIG="$HOME/.kube/config"
# export NODE_OPTIONS=--openssl-legacy-provider

eval "$(jump shell)"
plugins=(
  command-not-found
  git
  kubectl
  history
  emoji
  encode64
  sudo
  web-search
  copyfile
  copybuffer
  dirhistory
  jsontools
)
# add sudo shortcut is to hit the escape key twice
# e.g web_search google oh-my-zsh
# e.g copyfile file.py
# e.g ctry+o to copy the current command you just wrote
# dirhistory:
# Alt + Left Go to previous directory      Alt + Right 	Go to next directory
# Alt + Up Move into the parent directory  Alt + Down 	Move into the first child directory by alphabetical order
# history | grep node      to grep node related words from history commands
# jsontools used like:  curl path-to-api | pp_json

# aliases
# navigation and running files and folders
alias rm=trash
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias aliases="lvim ~/.oh-my-zsh/custom/aliases.zsh"
alias phpPro="cd /opt/lampp/htdocs/"
alias lvim="~/.local/bin/lvim"
alias xampp="cd /opt/lampp/ && sudo ./manager-linux-x64.run"
alias beekeeper="cd ~/AppsImage/ && clear && ./Beekeeper-Studio-3.7.10.AppImage"
alias goMigrate="~/AppsImage/migrate"
alias tmux="tmux -2"
alias mux="tmuxinator"
alias cleanCache="sudo dnf clean dbcache && dnf clean expire-cache && dnf clean metadata && dnf clean packages && dnf clean all"
alias ipme="ipconfig getifaddr en0"
alias show_port="sudo lsof -iTCP -sTCP:LISTEN -Pnl | grep"
alias l="ls -lF -G"
alias la="ls -laF -G" # List all files colorized in long format, including dot files
alias ll="ls -lF -G"
alias lsd="ls -lF -G | grep --color=never '^d'" # # List only directories
# alias replaceUnderscore="find . -type f -name "* *" -exec bash -c 'mv "$0" "${0// /_}"' {} \;"
# alias editTheme="p10k configure" #configure the oh-my-zsh theme

# Go
alias goCover='go test -coverprofile=coverage.out && go tool cover -html=coverage.out'
alias goTest='go test $(go list ./... | grep -v /vendor/)'
alias goLint='golint $(go list ./... | grep -v /vendor/)'

# flutter
alias flc='flutter create '
alias flpg='flutter pub get'
alias flpa='flutter pub add '
alias flpr='flutter pub remove '
alias flC='flutter clean'


# docker
alias d="docker"
alias ds="docker start"
alias dp="docker ps"
alias dP="docker push"
alias db="docker build"
alias dpa="docker ps -a"
alias di="docker images"
alias drc="docker rm"
alias dri="docker rmi"
alias k="kubectl"
alias kgs="kubectl get services"
alias kgp="kubectl get pods"
alias kgn="kubectl get namespace"
alias kgd="kubectl get deployments"
alias kdp="kubectl describe pod"
alias kdelp="kubectl delete pods"
alias kdeld="kubectl delete deployments.apps"
alias kdels="kubectl delete services"
alias kgsecrets="kubectl get secrets"
alias roll="kubectl rollout restart deployment"
# alias skaffold="skaffold dev --trigger polling"

# Git
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glog1="git  log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias glline="git log --oneline"
alias gc="git add . && git commit -m"
alias gs="pretty-git-status"
alias gsamend="git commit --amend" # undo last commit
alias gb="git branch" #+branchName: create
alias gbd="git branch -d" #delete
alias gbv="git branch -v" #for more info
alias gbr="git branch -r" #list remote branches,which local knows about
alias gcc="git switch -c" #+branchName to create one and switch
alias gcheck="git checkout" #+ branch/tag/..... or bugfix@{2.days.ago}
alias gf="git fetch" #+remote or +remote +branch
alias gpull="git pull" #default: origin trackingBranch, or  +remote +branch
alias gm="git merge"
alias gd="ydiff -s -w0 --wrap"
# alias gd="git diff" #or + v17.0.0 v17.9.8 or main@{0} main@{yesterday}
alias gdh="git diff HEAD"
alias gds="git diff --staged" #list what files will be included in the commits
#or +fileName to say the deffrince between the current file and the previous staged file
#or git diff commit1..commit2  or git diff branch1..branch2
alias gsl="git stash list"
alias gsa="git stash apply" #or + stash@{2} for specific stash
alias gsp="git stash pop" #remove most recent
alias gsd="git stash drop" #+ stash@{2}
alias gsc="git stash clear" #all stashes
alias gsu="git stash -u" #include the untracted files
alias gr="git restore" #+fileName or --source HEAD~1 fileName
alias grs="git restore --staged" #+fileName unstage file
alias greset="git reset" #commit hash reset repo
alias grh="git reset --hard" #+ commit hash or + HEAD~2
alias grevert="git revert" #+ commit hash: same as reset, but it prompt you to add a commit
alias gremote="git remote -v"
alias gremoterename="git remote rename"
alias gpom="git push origin master" #or git push origin pancake:waffle: local:remote
alias gpt="git push --tags" #to push with tags
alias grebase="git rebase" #same as merge,but it will rewrite the commit hashes
alias gri="git rebase -i" #+ HEAD~6, to add files,drop/edit commits
alias greflog="git reflog" #default to head, or:
# git reflog master@{one.week.ago}
alias gtl="git tag -l" #or eg + "*beta"
alias gt="git tag" #+ tagName +commitHash: tagging a commit
alias gta="git tag -a" #to create annotated tag
alias gtd="git tag -d" #delete
alias gcf="git cat-file -p" #or + -t + commitHash, see info about commit

# alias ghash="echo 'hello' | git hash-object --stdin"
alias gLogCountAll="git rev-list --all --count" #or --count <revision>


# laravel
alias pa="php artisan"
alias laraCreate="composer create-project --prefer-dist laravel/laravel"
alias jetstream="composer require laravel/jetstream"
alias livewire="php artisan jetstream:install livewire"
alias laraEnv="php artisan env"
alias laraRoutes="php artisan route:list"
alias pamc="php artisan make:controller"
alias pamm="php artisan make:model"
alias pammigration="php artisan make:migration"
alias pammiddleware="php artisan make:middleware"
alias pamf="php artisan make:factory"
alias pams="php artisan make:seeder"
alias pamj="php artisan make:job"
alias pasl="php artisan storage:link"
alias pacc="php artisan config:cache"
alias parc="php artisan route:cache"
alias pads="php artisan db:seed"

# npm
alias npmlist="npm list"
alias npmlistglobal="npm list -g --depth=0"
alias npmroot="npm root -g"

# multi purpose commands
alias dirsize="du -hs"
alias foldersSize="du -h --max-depth=1 | sort -h"
alias path='echo $PATH | tr -s ":" "\n"' # Pretty print the path
alias systemInfo="cat /etc/os-release"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'" # View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# alias filesUnderscore="find $1 -name "* *.*" -type f -print0 | \
# while read -d $'\0' f; do mv -v "$f" "${f// /_}"; done"
# alias filesFoldersUnderscore="find -name "* *" -print0 | sort -rz | \
# while read -d $'\0' f; do mv -v "$f" "$(dirname "$f")/$(basename "${f// /_}")"; done"
# netstat -ano | findstr :80
# taskkill /PID <LISTENING> /F
# last personal access token for github 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
#


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ahmad-khatib/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ahmad-khatib/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ahmad-khatib/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ahmad-khatib/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# pnpm
export PNPM_HOME="/home/ahmad-khatib/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Load Angular CLI autocompletion.
source <(ng completion script)


# Load Angular CLI autocompletion.
source <(ng completion script)

. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
export LD_LIBRARY_PATH=/usr/local/lib
