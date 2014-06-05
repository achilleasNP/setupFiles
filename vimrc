execute pathogen#infect()
set nocompatible
filetype plugin on
filetype indent on
syntax on
set shiftwidth=4
set expandtab
set ofu=syntaxcomplete#Complete
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set background=dark

let noweb_fold_code=2
let noweb_language="python"
au BufReadPost *.nw set filetype=noweb 
"Slime options
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
nmap <leader>s <Plug>SlimeMotionSend
xmap <leader>sr <Plug>SlimeRegionSend
nmap <leader>sl <Plug>SlimeLineSend

"Quick editing and sourcing of .vim file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Shortcut for checking perl syntax
nnoremap <leader>c :!perl -c %<cr>
nnoremap <leader>r :make<cr>
nnoremap <leader>rm :call delete(expand('%')) \| bdelete!<CR>

" insert date
inoremap <leader>date :r !date <return>

" Show errors syntastic
map <silent> <leader> e: Errors<CR>
map <leader>s :SyntasticToggleMode<CR>

" Set status bar
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"New abbreviations
iabbrev @@ anp4r@virginia.edu
" Set makeprg for different languages
au FileType cpp set makeprg=g++\ %
au FileType haskell set makeprg=ghc\ %
au FileType perl set makeprg=perl\ %
au FileType python set makeprg=python\ %

" Show diffs between current file and original
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis |wincmd p | diffthis
