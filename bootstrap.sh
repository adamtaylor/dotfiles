files=("gitconfig" "gitignore" "git-completion.bash" "perldb" "vimrc" "bash_generic" "bash_work" "bashrc" "bash_profile")
dotfiles=`pwd`

echo "This will overwrite any config files, continue? [y/n]";
read line

if [ "$line" != 'y' ]; then
    echo "didn't install new configs";
    echo "re-run and hit 'y' if you wanted to install them";
    exit 0;
fi

# copy across the bin/ files
echo "Installing utility scripts...";
if [ -d $HOME/bin ]; then
    echo "[DEBUG] cp $dotfiles/bin/* $HOME/bin/.";
    `cp $dotfiles/bin/* $HOME/bin/.`;
else
    echo "[DEBUG] ln -s $dotfiles/bin $HOME/bin";
    `ln -s $dotfiles/bin $HOME/bin`;
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
echo "Installing Vim files...";
if [ -s $HOME/.vim ]; then
    echo "[DEBUG] rm -rf $HOME/.vim";
    `rm -rf $HOME/.vim`
fi

echo "[DEBUG] ln -s $dotfiles/vim $HOME/.vim";
`ln -s $dotfiles/vim $HOME/.vim`;

echo "Attempt to install vim plugins? [y/n]";
read line
if [ "$line" == 'y' ]; then
    echo "Installing Vim plugins..."
    `vim +BundleInstall +qall`
    if [ -s $HOME/.vim/bundle/YouCompleteMe ]; then
        echo "Compiling YouCompleteMe plugin..."
        exec $HOME/.vim/bundle/YouCompleteMe/install.sh
    fi
else
    echo "Plugins can be installed manually with <<vim +BundleInstall +qall>>"
fi

# link up our gitignore file (don't know how to set $HOME in gitconfig)
echo "Adding gitignore...";
echo "[DEBUG] git config --global core.excludesfile ~/.gitignore";
`git config --global core.excludesfile ~/.gitignore`

exit 0;
