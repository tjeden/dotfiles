export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin

export PS1="\u@\h:\w$ "
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export VISUAL=vim
export EDITOR="$VISUAL"
source ~/.rvm/scripts/rvm
source ~/.env

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
