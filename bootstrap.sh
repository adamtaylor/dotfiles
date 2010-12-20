files=("gitconfig" "gitignore" "perldb" "vimrc" "bash_generic" "bashrc" "bash_profile")
dotfiles=`pwd`

echo "This will overwrite any config files, continue? [y/n]";
read line

if [ "$line" != 'y' ]; then
    echo "didn't install new configs";
    echo "re-run and hit 'y' if you wanted to install them";
    exit 0;
fi

# copy the config files to their location
echo "Installing conf files...";
for conf in ${files[@]}; do
    if [ -f ./${conf} ]; then 
        echo "[DEBUG] cp ${conf} $HOME/.${conf}";
        `cp ${conf} $HOME/.${conf}`;
    fi
done

# link my vim configs
echo "Installing VIM files...";
if [ -s $HOME/.vim ]; then
    echo "[DEBUG] rm -rf $HOME/.vim";
    `rm -rf $HOME/.vim`
fi
echo "[DEBUG] ln -s $dotfiles/vim $HOME/.vim";
`ln -s $dotfiles/vim $HOME/.vim`;

# link up our gitignore file (don't know how to set $HOME in gitconfig)
echo "Adding gitignore...";
echo "[DEBUG] git config --global core.excludesfile ~/.gitignore";
`git config --global core.excludesfile ~/.gitignore`
