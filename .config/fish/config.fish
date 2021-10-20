starship init fish | source
# source ~/.local/share/icons-in-terminal/icons.fish

#alias neofetch ="neofetch && tuptime"
function neo --wraps 'neofetch && tuptime' --description 'alias neo=neofetch && tuptime'
    command neofetch && tuptime $argv
end

alias v="nvim (fzf)"
alias lll="exa -la --icons --sort name"

# alias dot      ="/usr/bin/git --git-dir=/home/jammo/.dotfiles --work-tree=/home/jammo"
function dot --wraps '/usr/bin/git --git-dir=/home/jammo/.dotfiles --work-tree=/home/jammo' --description 'alias dot=/usr/bin/git --git-dir=/home/jammo/.dotfiles --work-tree=/home/jammo'
    /usr/bin/git --git-dir=/home/jammo/.dotfiles --work-tree=/home/jammo $argv
end

# alias gistory  ="history | grep"
function gistory --wraps 'history | grep' --description 'alias gistory=history | grep'
    history | grep $argv
end

export EDITOR="$VISUAL"
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
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
