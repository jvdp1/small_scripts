" .vimrc

syntax on
set syntax=sas
set mouse=a
set showcmd

"set ai
"filetype indent on

"au VimLeave * :!clear

au BufWinLeave * mkview
au BufWinEnter * silent loadview

let fortran_fold=1
au BufRead,BufNewFile *.f90  set foldmethod=syntax 
au BufRead,BufNewFile *.F90  set foldmethod=syntax 
au BufRead,BufNewFile *.f  set foldmethod=syntax 

function! Tab_Or_Complete()
 if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~'^\w'
  return "\<C-N>"
 else
  return "\<Tab>"
 endif
endfunction

inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"


filetype plugin on
set shellslash
set grepprg=grep\ -nH\ $*

let @f='aprogram  implicit none integer::iend program OAOAOAOAOA'
let @c='i!OB'
let @r='i#OB'
let @m='i!!!!!!!!!!!!!!!!!!!MODIFICATIONS!!!!!!!!!!!!!!!!!!!'

