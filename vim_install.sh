#!/bin/bash
cd $HOME
if [ -e .vim ]
then
        echo ".vim directory already exists"
        echo "Do your want to continue anyway?(yes/no)[no]"

        read answer
        if [[ $answer != "yes" ]]
        then
                exit 0
        else
                rm -rf .vim
        fi
fi
vimBundleRoot="${HOME}/.vim/bundle"

mkdir -p .vim/autoload .vim/bundle
curl 'www.vim.org/scripts/download_script.php?src_id=19375'\
        > .vim/autoload/pathogen.vim
echo "execute pathogen#infect()" >> ~/.vimrc
cd .vim/bundle
git clone https://github.com/ervandew/screen.git
git clone  https://github.com/ervandew/supertab.git
cd $HOME
# Noweb syntax 
mkdir -p .vim/syntax
curl 'www.vim.org/scripts/download_script.php?src_id=13268'\
        > .vim/syntax/noweb.vim

curl 'www.vim.org/scripts/download_script.php?src_id=19802'\
        > vim-r-plugin.zip
vimRplugin="${vimBundleRoot}/vimrplugin"
mkdir ${vimRplugin}
unzip vim-r-plugin.zip -d ${vimRplugin}
curl 'www.vim.org/scripts/download_script.php?src_id=11006'\
        > snipMate.zip
vimSnipMate="${vimBundleRoot}/snipMate"
unzip snipMate.zip -d ${vimSnipMate}
