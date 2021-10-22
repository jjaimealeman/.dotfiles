# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
    # Make it fish compatible.
#    PATH"$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
   PATH="$HOME/.local/bin:$PATH"
fi
# Make it fish compatible.
# if
#     [-d "$HOME/.local/bin" ]
#     PATH"$HOME/.local/bin:$PATH"
# end

# wed aug 18 21
# this is here for firefox developer edition
PATH=${PATH}:"${HOME}/.local/bin"
# Make it fish compatible.
# PATH {$PATH}:"{$HOME}/.local/bin"

. "$HOME/.cargo/env"

# tue oct 19 2021
# could not npm install -g, said i didnt have permissions, so this is the fix
# https://stackoverflow.com/questions/48910876/error-eacces-permission-denied-access-usr-local-lib-node-modules
export PATH=~/.npm-global/bin:$PATH
# UPDATE!!!
# putting this in config.fish instead

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

