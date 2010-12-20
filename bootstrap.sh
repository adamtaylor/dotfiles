files=("gitconfig" "gitignore" "perldb" "vimrc" "bash_generic" "bashrc" "bash_profile")

echo "This will overwrite any config files, continue? [y/n]";
read line

if [ "$line" != 'y' ]; then
    echo "didn't install new configs";
    echo "re-run and hit 'y' if you wanted to install them";
    exit 0;
fi

# copy the config files to their location
for conf in ${files[@]}; do
    if [ -f ./${conf} ]; then 
        echo "[DEBUG] cp ${conf} $HOME/.${conf}";
        `cp ${conf} $HOME/.${conf}`;
    fi
done

# link my vim configs
if [ -d $HOME/.vim ]; then
    echo "[DEBUG] rm -rf $HOME/.vim";
    `rm -rf $HOME/.vim`
fi
echo "[DEBUG] mkdir $HOME/.vim";
`mkdir $HOME/.vim`;
echo "[DEBUG] mkdir $HOME/.vim/colors";
`mkdir $HOME/.vim/colors`;
if [ -f ./vim/colors/molokai.vim ]; then
    echo "[DEBUG] cp molokai.vim $HOME/.vim/colors/molokai.vim";
    `cp ./vim/colors/molokai.vim $HOME/.vim/colors/molokai.vim`;
fi

# link up our gitignore file (don't know how to set $HOME in gitconfig)
echo "[DEBUG] git config --global core.excludesfile ~/.gitignore";
`git config --global core.excludesfile ~/.gitignore`
