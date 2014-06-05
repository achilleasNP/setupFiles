#!/bin/bash

if [ -e ${HOME}/.vimrc ]
then
        echo ".vimrc file already exists"
        echo "Do your want to continue anyway?(yes/no)[no]"
        read answer

        if [[ $answer != "yes" ]]
        then
                exit 0
        else
               cp vimrc ${HOME}/.vimrc
                
        fi
fi


cd $HOME
if [ -e .vim ]
then
        echo ".vim directory already exists"
        answer="no"
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


# Install pathogen
mkdir -p .vim/autoload .vim/bundle
curl 'www.vim.org/scripts/download_script.php?src_id=19375'\
        > .vim/autoload/pathogen.vim

cd  ${vimBundleRoot}
# Install supertab
git clone  https://github.com/ervandew/supertab.git
# Install syntastic
git clone https://github.com/scrooloose/syntastic.git
# Install vim-slime
git clone git://github.com/jpalardy/vim-slime.git
# Install vim-surround
git clone git://github.com/tpope/vim-surround.git
# Install vim-markdown
git clone https://github.com/plasticboy/vim-markdown.git
cd $HOME

# Noweb syntax 
mkdir -p .vim/syntax
curl 'www.vim.org/scripts/download_script.php?src_id=13268'\
        > .vim/syntax/noweb.vim

# vimSnipMate
curl 'www.vim.org/scripts/download_script.php?src_id=11006'\
        > snipMate.zip
vimSnipMate="${vimBundleRoot}/snipMate"
unzip snipMate.zip -d ${vimSnipMate}
rm snipMate.zip
