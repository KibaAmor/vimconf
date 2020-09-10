" EasyAlign {{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}

" NERD Commenter {{
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" }}

" NERDTree {{
nmap <F9> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden       = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI        = 1
" }}


" Leaderf {{
" install ripgrep(https://github.com/BurntSushi/ripgrep) for use rg
let g:Lf_ShortcutF = '<c-p>'
noremap <Leader>ff :LeaderfFunction<cr>
noremap <Leader>fb :LeaderfBuffer<cr>
noremap <Leader>ft :LeaderfTag<cr>
noremap <Leader>fm :LeaderfMru<cr>
noremap <Leader>fl :LeaderfLine<cr>
noremap <Leader>fc :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", expand("<cword>"))<CR><CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e ")<CR>

let g:Lf_StlSeparator         = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers          = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight         = 0.30
let g:Lf_CacheDirectory       = expand('~/.vim/cache')
let g:Lf_ShowRelativePath     = 0
let g:Lf_HideHelp             = 1
let g:Lf_StlColorscheme       = 'powerline'
let g:Lf_PreviewResult        = {'Function':0, 'BufTag':0}

let g:Lf_NormalMap            = {
    \ "File":        [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer":      [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":         [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":         [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme": [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }
" }}


" rainbow {{
let g:rainbow_active = 1
" }}


" colorscheme {{
" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

let g:lightline = { 'colorscheme': 'onedark' }
syntax on
try
    colorscheme onedark
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry
" }}


" airline {{
let g:airline_theme                             = 'onedark'
let g:airline_powerline_fonts                   = 1
let g:airline#extensions#whitespace#enabled     = 0
let g:airline#extensions#whitespace#symbol      = '!'
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter      = 'unique_tail'
" }}

" easymotion {{
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Space>   <Plug><easymotion-bd-w)
nmap <Space>   <Plug>(easymotion-overwin-w)
map  <Leader>W <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)
" }}

" incsearch {{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}
