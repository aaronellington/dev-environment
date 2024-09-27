# Go Root
set -x GOROOT $HOME/.local/go
mkdir -p $GOROOT/bin
set -x PATH $GOROOT/bin $PATH

# Go Path
set -x GOPATH $HOME/.go
mkdir -p $GOPATH/bin
set -x PATH $GOPATH/bin $PATH
