starship init fish | source

# https://www.markhansen.co.nz/auto-start-tmux/
# Adapted from https://github.com/fish-shell/fish-shell/issues/4434#issuecomment-332626369
# only run in interactive (not automated SSH for example)
if status is-interactive
# don't nest inside another tmux
and not set -q TMUX
  # Adapted from https://unix.stackexchange.com/a/176885/347104
  # Create session 'main' or attach to 'main' if already exists.
  tmux new-session -A -s main
end

# EXTRACT is a function called from /functions/extract.fish
alias ext extract
alias v="nvim (fzf)"
# LIST ALL
alias ll="exa -la --icons --sort name --group-directories-first --git"
# LIST ONLY DIRECTORIES
alias ld="exa -lD --icons --sort name --git"
# CD & LL 
# cdls() { cd "$@" && ls; }
# alias cdd="cd '$argv' && ll"
function cdd --wraps "cd '$argv' && ll" --description "alias cdd=cd '$argv' && ll"
    builtin cd $argv && ll
end


function neo --wraps 'neofetch && tuptime' --description 'alias neo=neofetch && tuptime'
    command neofetch && tuptime $argv
end


function dot --wraps '/usr/bin/git --git-dir=/home/jammo/.dotfiles --work-tree=/home/jammo' --description 'alias dot=/usr/bin/git --git-dir=/home/jammo/.dotfiles --work-tree=/home/jammo'
    /usr/bin/git --git-dir=/home/jammo/.dotfiles --work-tree=/home/jammo $argv
end


function gistory --wraps 'history | grep' --description 'alias gistory=history | grep'
    history | grep $argv
end


function fzfb --wraps "fzf --preview 'bat {} --color=always' --bind shift-up:preview-page-up,shift-down:preview-page-down"
    command fzf --preview 'bat {} --color=always' --bind shift-up:preview-page-up,shift-down:preview-page-down
end


export EDITOR="$VISUAL"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'


# tue oct 19 2021
# could not 'npm install -g tldr', said i didnt have permissions, so this is the fix
# https://stackoverflow.com/questions/48910876/error-eacces-permission-denied-access-usr-local-lib-node-modules
# THIS LINE won't work, it's only for $bash
# export PATH=~/.npm-global/bin:$PATH
# This didn't work, so I'm trying this method:
# fish_add_path -P /home/jammo/.npm-global/bin
# https://www.reddit.com/r/fishshell/comments/gmr18t/what_is_the_right_way_to_set_path_variables_in/fr8bq3f/
if status is-login
    set PATH ~/.npm-global/bin $PATH
end

# set PATH for this:
# /home/jammo/Downloads/todo.txt-cli
set PATH "$HOME/.local/bin:$PATH"

