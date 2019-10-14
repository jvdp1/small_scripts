" .vimrc

syntax on

hi LineNr          term=bold ctermfg=5 ctermbg=7 gui=bold guifg=Brown guibg=LightGrey
hi CursorLineNr    term=bold ctermfg=130 ctermbg=7 gui=bold guifg=Brown guibg=LightGrey

set syntax=sas
set mouse=a
set showcmd

set path+=**   "To be used with :find file

function! NumberToggle()
 if(&relativenumber == 1)
  set number
 else
  set relativenumber
 endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>


set relativenumber
set number

"au VimLeave * :!clear

au BufWinLeave * mkview
au BufWinEnter * silent loadview

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

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


call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<F2>"
let g:UltiSnipsJumpForwardTrigger="<F2>"
let g:UltiSnipsJumpBackwardTrigger="<F3>"
Plug 'honza/vim-snippets'

"Plug 'lervag/vimtex'
"let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0

"Plug 'KeitaNakamura/tex-conceal.vim'
"set conceallevel=1
"let g:tex_conceal='abdmg'


call plug#end()


filetype indent off
set ai

setlocal spell
set spelllang=en_us


let @a='i OB'
let @f='ainclude "/home/WUR/vande018/opti/files/filemod.f90"program  use filemod implicit none integer::i,j,io,uncontains subroutine numlines(unfile,n) implicit none integer::io integer,intent(in)::unfile integer,intent(out)::n n=0 do  read(unfile,*,iostat=io)  if (io.ne.0) exit  n=n+1 enddo rewind(unfile)end subroutinesubroutine numcol(unfile,n) implicit none integer,intent(in)::unfile character(len=1000000)::a integer,intent(out)::n integer::curr,first,last,lena,stat,i rewind(unfile) read(unfile,"(a)")a curr=1;lena=len(a);n=0 do  first=0  do i=curr,lena   if (a(i:i) /= " ") then    first=i    exit   endif  enddo  if (first == 0) exit  curr=first+1  last=0  do i=curr,lena   if (a(i:i) == " ") then    last=i    exit   endif  enddo  if (last == 0) last=lena  n=n+1  curr=last+1 enddo rewind(unfile)end subroutineend programggOBOBA'
let @c='a#include <stdio.h>#include <iostream>#include <string>#include <stdlib.h>#include <math.h>#include <time.h>int main (int argc, char *argv[]){ return 0;}3k'
let @p='a#include <iostream>#include <cmath>#include <vector>#include <string>using namespace std;int main (){ return 0;}3k'
let @v='i!OB'
let @r='i#OB'
