set -x DEV_ENV_CONFIG_DIR (dirname (status --current-filename))

set -x PATH $DEV_ENV_CONFIG_DIR/bin $PATH
set fish_function_path "$DEV_ENV_CONFIG_DIR/fish/functions" $fish_function_path

source $DEV_ENV_CONFIG_DIR/fish/git.fish
source $DEV_ENV_CONFIG_DIR/fish/go.fish
source $DEV_ENV_CONFIG_DIR/fish/node.fish
source $DEV_ENV_CONFIG_DIR/fish/php.fish
