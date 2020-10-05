set nocompatible
set nu
set laststatus=2
set termencoding=utf-8
filetype indent plugin on
syntax enable

"#######################
"undo & backupdir
"#######################

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
nnoremap <F9> :NERDTreeToggle<CR>
call vundle#end()

let g:auto_save = 1
set backup                        " enable backups
set noswapfile

set undodir=~/tmp/undo/     " undo files
set backupdir=~/tmp/backup/ " backups
set directory=~/tmp/swap/   " swap files

" Tab control
set expandtab
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 " the visible width of tabs
set softtabstop=2 " edit as if the tabs are 4 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
%retab

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

set history=1000
set undofile "we like the undo file"
set undolevels=1000
set undoreload=1000

" swap dir
augroup NoSimulataneousEdits
  autocmd!
  autocmd SwapExists * let v:swapchoice= 'o'
  autocmd SwapExists * echomsg ErrorMsg
  autocmd SwapExists * echo 'Duplicate edit session (readonly)'
  autocmd SwapExists * echohl None
augroup END


"general mappinggt
nnoremap sss :%s/\s\+$//<CR>
nnoremap rrr :source ~/.vimrc<CR>

function! RESIZEVERT(PlusMinus)
 let num=tabpagewinnr(tabpagenr())
  let pm=a:PlusMinus
  if  num == "2"
    let pm = pm == '+' ? '-' : '+'
  end
  exec "resize " . pm . "1"
endfunction

nnoremap <silent> <DOWN>   :call RESIZEVERT("-")<CR>
nnoremap <silent> <UP> :call RESIZEVERT("+")<CR>

nnoremap <silent> <LEFT> :vertical resize +2<CR>
nnoremap <silent> <RIGHT> :vertical resize -2<CR>
