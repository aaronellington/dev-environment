set -x GOROOT $HOME/.local/go
mkdir -p $GOROOT/bin
set -x PATH $GOROOT/bin $PATH

set -x GOPATH $HOME/.go
mkdir -p $GOPATH/bin
set -x PATH $GOPATH/bin $PATH
