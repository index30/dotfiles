# Path to your oh-my-zsh installation.
export ZSH=/Users/yusei/.oh-my-zsh

#環境変数の設定
#http://qiita.com/tstomoki/items/0f1a930bd42a8e1fdaac
export PGDATA=/usr/local/var/postgres

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wedisagree"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/Users/yusei/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin"
export CASSANDRA_HOME=/usr/local/Cellar/cassandra/2.2.0/
export CASSANDRA_INCLUDE=/usr/local/Cellar/cassandra/2.2.0/share/cassandra.in.sh

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
#環境変数
export LANG=ja_JP.UTF-8
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#プロンプト
PROMPT="%{${fg[yellow]}%}[%n]%{${reset_color}%} %~
%# "

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
#function mkgit(){
 #   git add .;
  #  git commit -m "test commit";
   # git
    #}

alias casspark="spark-shell --conf spark.cassandra.connection.host=127.0.0.1 --jars /Users/yusei/solflare/forcass/spark-cassandra-connector/spark-cassandra-connector-java/target/scala-2.10/spark-cassandra-connector-java-assembly-1.5.0-M2-SNAPSHOT.jar"
alias ctlload="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist"
alias ctlunload="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist"
alias d="dvipdfmx"
alias e='emacs'
alias gfetch="git fetch origin master"
alias gpull="git pull origin master"
alias gpush="git push origin master"
alias hgit='git add .;git commit -m "test commit";git push heroku master'
alias i="git init"
alias j="java"
alias jc="javac"
alias miniocaml="ledit ./miniocaml"
alias ocaml="ledit ocaml"
alias p="platex"
alias python="python3"
#sshにおいて、オプションを付けて脆弱性を回避
alias s="ssh abelia05 -o \"UseRoaming no\""
alias slab="ssh miura@shanon.mma.cs.tsukuba.ac.jp -o \"UseRoaming no\""
alias clab="ssh miura@cybele.mma.cs.tsukuba.ac.jp -o \"UseRoaming no\""
alias startzep="cd;cd incubator-zeppelin;./bin/zeppelin-daemon.sh start"
alias stopzep="./bin/zeppelin-daemon.sh stop;cd"
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
       /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# ディレクトリ名だけでcdする
setopt auto_cd

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# コマンドのスペルの訂正を試みる
setopt CORRECT

# コマンド行の全ての引数に対してスペルミスの訂正を試みる
unsetopt CORRECT_ALL

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_ROOT=/usr/local/var/pyenv

# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
