" colorscheme {{
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        "set termguicolors
    endif
endif

if (has("autocmd"))
  augroup colorextend
    autocmd!
    " Make `Function`s bold in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
    " Override the `Statement` foreground color in 256-color mode
    autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
    " Override the `Identifier` background color in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
  augroup END
endif

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

let g:onedark_color_overrides = {
	\ "black": {"gui": "#2F343F", "cterm": "235", "cterm16": "0" },
	\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
	\}

"let g:onedark_terminal_italics = 1
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

syntax on
try
    colorscheme onedark
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry
" }}


" airline {{
let g:airline_theme                             = 'onedark'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts                   = 1
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" }}


" EasyGrep {{
let g:EasyGrepMode                 = 3 " all:0, open buffers:1, trackext:2, usermode:3
let g:EasyGrepCommand              = 1 " use vimgrep:0, grepprg:1
let g:EasyGrepRecursive            = 1 " recursive searching
let g:EasyGrepHidden               = 1 " searching hidden file
let g:EasyGrepIgnoreCase           = 1 " not ignorecase:0
let g:EasyGrepAllOptionsInExplorer = 1 " show all options
let g:EasyGrepFilesToExclude       = "*.bak, *~, cscope.*, *.a, *.o, *.pyc, *.bak"
let g:EasyGrepDefaultUserPattern   = "*.h *.hh *.hpp *.inl *.c *.cc *.cpp *.cxx *.cs *.lua *.conf *.cf *.cfg *.config *.ini *.diff *.rej *.patch *.php *.pl *.PL  *.py *.pyw *.sql *.sqlj *.msql *.mysql *.pls *.plsql *.zsql *.sh *.bash *.ksh *.tcsh *.cmd *.bat *.txt *.inf *.INF *.vim .vimrc .gvimrc *.vba .exrc _exrc *.module *.pkg *.xml"
" }}


" EasyAlign {{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}


" rainbow {{
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}
" }}


" fencview {{
let g:fencview_autodetect = 1
" }}


" NERDTree {{
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable  = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDChristmasTree           = 1
let g:NERDTreeAutoCenter          = 1
let g:NERDTreeMouseMode           = 2
let g:NERDTreeShowBookmarks       = 1
let g:NERDTreeShowFiles           = 1
let g:NERDTreeShowLineNumbers     = 1
let g:NERDTreeWinPos              = 'left'
let g:NERDTreeWinSize             = 31
let g:NERDTreeStatusline          = 1
" }}


" ale {{
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 3
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c14'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta
" }}


" Leaderf {{
noremap <c-m> :LeaderfMru<cr>
noremap <c-f> :LeaderfFunction<cr>
noremap <c-b> :LeaderfTag<cr>
let g:Lf_ShortcutF            = '<c-p>'
let g:Lf_ShortcutB            = ''
let g:Lf_CommandMap           = {'<CR>': ['']}
let g:Lf_StlColorscheme       = 'powerline'
let g:Lf_RootMarkers          = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight         = 0.30
let g:Lf_CacheDirectory       = expand('~/.vim/cache')
let g:Lf_ShowRelativePath     = 0
let g:Lf_HideHelp             = 0
let g:Lf_PreviewResult        = {'Function':0, 'Colorscheme':1}
let g:Lf_NormalMap            = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }
" }}


" bufexplorer {{
function DeleteAllBuffersInWindow() 
    let s:curWinNr = winnr()
    if winbufnr(s:curWinNr) == 1
        ret
    endif
    let s:curBufNr = bufnr("%")
    exe "bn"
    let s:nextBufNr = bufnr("%")
    while s:nextBufNr != s:curBufNr
        exe "bn"
        exe "bdel ".s:nextBufNr
        let s:nextBufNr = bufnr("%")
    endwhile
endfunction

" Don't close window, when deleting a buffer
command Bclose call <SID>BufcloseCloseIt()
function <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

" close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" close all except this
map <leader>bo :call DeleteAllBuffersInWindow()<CR>
" close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>
" }}


" {{ vim-gutentags
" CTRL-W ] to see function definition in new tab
" CTRL-W } to see function definition in preview window
let g:gutentags_project_root      = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile     = '.tags'
let s:vim_tags                    = expand('~/.cache/tags')
let g:gutentags_cache_dir         = s:vim_tags
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args  = ['-I __THROW', '-I __attribute__', '-I __attribute_pure__', '-I __nonnull']
let g:gutentags_ctags_extra_args += ['--file-scope=yes', '--langmap=c:+.h','--languages=c,c++', '--links=yes']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px', '--c++-kinds=+px', '--fields=+niazS', '--extra=+q', '-R']
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" }}


" {{ echodoc
" To use echodoc, you must increase 'cmdheight' value.
set cmdheight=2
let g:echodoc_enable_at_startup = 1
" }}


" {{ ycm
" execute command "clang -E -v -x c++ -" to get include path
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
let g:ycm_key_invoke_completion = '<c-z>'
"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
    \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
    \ 'cs,lua,javascript': ['re!\w{2}'],
    \ }
let g:ycm_filetype_whitelist = {
    \ "h":1,
    \ "hh":1,
    \ "hpp":1,
    \ "c":1,
    \ "cc":1,
    \ "cpp":1,
    \ "cxx":1, 
    \ "objc":1,
    \ "sh":1,
    \ "zsh":1,
    \ }
 " }}
