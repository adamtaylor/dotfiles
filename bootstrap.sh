files=("gitconfig" "gitignore" "perldb" "vimrc" "bash_generic" "bashrc" "bash_profile")

# copy the config files to their location
for conf in ${files[@]}; do
    if [ -f ./${conf} ]; then 
        echo "[DEBUG] cp ${conf} $HOME/.${conf}";
        `cp ${conf} $HOME/.${conf}`;
    fi
done

# link up our gitignore file (don't know how to set $HOME in gitconfig)
`git config --global core.excludesfile ~/.gitignore`
