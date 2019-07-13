" basic key mapping

let mapleader = ","
let g:mapleader = ","

" remap vim 0 to first non-blank character
map 0 ^

" switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" fast saving
nmap <leader>w :w!<cr>

" show all marks
nmap <leader>m :marks<cr>

" fast fold
" nnoremap <C-space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>
nmap <leader>z @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>

" fast clear the space at the end of line
nmap cS :%s/\s\+$//g<cr>:noh<cr>
" fast clear '^M' at the end of line
nmap cM :%s/\r$//g<cr>:noh<cr>

" display tabs and trailing spaces visually
nmap <silent><leader>s :set nolist!<cr>

" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if (has("mac") || has("macunix"))
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" smart way to move between buffers
nmap <leader>e :tabedit <c-r>=expand("%:p:h")<cr>/
nmap <leader>m :tabnew<cr>
nmap <leader>c :tabclose<cr>
nmap <leader>p :tabprevious<cr>
nmap <leader>n :tabnext<cr>
nmap <leader>o :tabonly<cr>
nmap <leader>1 :tabn 1<cr>
nmap <leader>2 :tabn 2<cr>
nmap <leader>3 :tabn 3<cr>
nmap <leader>4 :tabn 4<cr>
nmap <leader>5 :tabn 5<cr>
nmap <leader>6 :tabn 6<cr>
nmap <leader>7 :tabn 7<cr>
nmap <leader>8 :tabn 8<cr>
nmap <leader>9 :tabn 9<cr>
nmap <leader>0 :tabn 10<cr>

nnoremap <F6> :cclose<cr>
nmap <F7> :cnext<cr>
nmap <F8> :cprevious<cr>

map <silent> <F9> :if &guioptions =~# 'm' <Bar>
    \set guioptions-=m <Bar>
    \set guioptions-=T <Bar>
    \set guioptions-=r <Bar>
    \set guioptions-=L <Bar>
    \else <Bar>
    \set guioptions+=m <Bar>
    \set guioptions+=T <Bar>
    \set guioptions+=r <Bar>
    \set guioptions+=L <Bar>
    \endif<CR>
