" {{ undotree
nnoremap <F5> :UndotreeToggle<cr>
" }}


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


" {{ vim-gutentags and gutentags_plus
" CTRL-W ] to see function definition in new tab
" CTRL-W } to see function definition in preview window
" <leader>cs	Find symbol (reference) under cursor
" <leader>cg	Find symbol definition under cursor
" <leader>cd	Functions called by this function
" <leader>cc	Functions calling this function
" <leader>ct	Find text string under cursor
" <leader>ce	Find egrep pattern under cursor
" <leader>cf	Find file name under cursor
" <leader>ci	Find files #including the file name under cursor
" <leader>ca	Find places where current symbol is assigned
set tags=./.tags;,.tags
let $GTAGSLABEL = 'pygments'
let $GTAGSCONF = '/etc/gtags.conf'

let g:gutentags_project_root      = ['.root', '.svn', '.git', '.hg', '.project']

let g:gutentags_ctags_tagfile     = '.tags'

let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

let s:vim_tags                    = expand('~/.cache/tags')
let g:gutentags_cache_dir         = s:vim_tags
let g:gutentags_ctags_extra_args  = ['-I __THROW', '-I __attribute__', '-I __attribute_pure__', '-I __nonnull']
let g:gutentags_ctags_extra_args += ['--file-scope=yes', '--langmap=c:+.h','--languages=c,c++', '--links=yes']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px', '--c++-kinds=+px', '--fields=+niazS', '--extra=+q', '-R']
" enable below line if use universal ctags
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

let g:gutentags_auto_add_gtags_cscope = 0

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" }}


" Leaderf {{
let g:Lf_ShortcutF = '<c-p>'
noremap <Leader>ff :LeaderfFunction<cr>
noremap <Leader>fb :LeaderfBuffer<cr>
noremap <Leader>ft :LeaderfTag<cr>
noremap <Leader>fm :LeaderfMru<cr>
noremap <Leader>fl :LeaderfLine<cr>
 
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


" ale {{
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_list_window_size = 3
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c11'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
" }}


" asyncrun {{
let g:asyncrun_open = 12
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
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
let g:ycm_confirm_extra_conf = 0

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
    \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
    \ 'cs,lua,javascript': ['re!\w{2}'],
    \ }
let g:ycm_filetype_whitelist = {
    \ "c":1,
    \ "cpp":1,
    \ "go":1,
    \ "python":1,
    \ "sh":1,
    \ "zsh":1,
    \ }
let g:ycm_filetype_blacklist = {
    \ 'markdown' : 1,
    \ 'text' : 1,
    \ 'pandoc' : 1,
    \ 'infolog' : 1,
    \ }
" }}


" {{ vim-go
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)


let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
" }}


" ultisnips {{
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<space>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" }}


" CompleteParameter.vim {{
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
" }}

" rainbow {{
let g:rainbow_active = 1
" }}


" indentLine {{
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" }}


" colorscheme {{
let g:lightline = { 'colorscheme': 'onedark' }
syntax on
try
    colorscheme onedark
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry
" }}


" airline {{ let g:airline_theme                             = 'onedark'
let g:airline_powerline_fonts                   = 1
let g:airline#extensions#whitespace#enabled     = 0
let g:airline#extensions#whitespace#symbol      = '!'
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter      = 'unique_tail'
" }}
