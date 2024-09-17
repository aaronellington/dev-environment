# Git safe trick
set -x PATH .git/safe/../../bin $PATH
set -x PATH .git/safe-bin $PATH

set -l DEV_ENV_CONFIG_DIR_LOCAL (string replace -a $HOME "~" $DEV_ENV_CONFIG_DIR)

# git config --global core.excludesFile "$DEV_ENV_CONFIG_DIR_LOCAL/files/.gitignore"
# git config --global init.defaultBranch main
# git config --global push.autoSetupRemote true
# git config --global pull.rebase false

# git config --global alias.acp "!f() { git add --all && git commit -m \"\$1\" && git push ; } ; f"
# git config --global alias.undo "!git reset HEAD^"
# git config --global alias.wip "!git acp wip"
