export GOPATH=$HOME/go
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin

export PS1="\u@\h:\w$ "

eval "$(rbenv init -)"

alias documas_path="export DOCUMAS_PATH=~/code/documas_core"
alias documas_path_down="unset DOCUMAS_PATH"
alias ip_path="export IP_PATH=~/code/ip"
alias ip_path_down="unset IP_PATH"
alias recruitment_path="export RECRUITMENT_REQUESTS_PATH=~/code/recruitment-requests"
alias recruitment_path_down="unset RECRUITMENT_REQUESTS_PATH"
