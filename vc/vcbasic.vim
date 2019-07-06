" basic settings

set nocompatible

" filetype {{
filetype on
filetype plugin on
filetype indent on
" }}

" encoding {{
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
set fileformat=unix
set fileformats=unix,dos,mac
" }}

" tab {{
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cindent
set autoindent
set smartindent
set smarttab
" }}

" search {{
set hlsearch
set incsearch
set smartcase
set showmatch
set matchtime=6
" }}

" timeout {{
set timeoutlen=2000
set ttimeout
" }}

" bells {{
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" }}

" fold {{
set nofoldenable
set foldmethod=indent
set foldlevel=3
" }}

" wrap {{
set wrap
set linebreak
" }}

" list char {{
set list listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
autocmd BufRead,BufNewFile,BufEnter * exe ":set nolist"
" }}

" ignore {{
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
set wildignore+=*vim/backups*
" }}

" command line {{
set magic
set ruler
set number
set title
set showcmd
set showmode
set cmdheight=2
set scrolloff=6
set cursorline
" set cursorcolumn
set shortmess=atI
set laststatus=2
let &statusline='%t %{&mod?(&ro?"*":"+"):(&ro?"=":" ")} %1*|%* %{&ft==""?"any":&ft} %1*|%* %{&ff} %1*|%* %{(&fenc=="")?&enc:&fenc}%{(&bomb?",BOM":"")} %1*|%* CWD:%r%{getcwd()}%h %=%1*|%* 0x%B %1*|%* (%l,%c%V) %1*|%* %L %1*|%* %P'
" }}

" backup {{
set nobackup
set writebackup
set noswapfile
" }}

set autoread
set autowrite
set mouse=anv
set clipboard+=unnamed
set noexrc
set ambiwidth=double
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set history=512

" keep undo history across sessions, by storing in file.
" only works all the time.
if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
    set undolevels=1024
    set undoreload=10240
endif

" return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" remember info about open buffers on close
set viminfo^=%

" specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

autocmd FileType perl set keywordprg=perldoc\ -f
autocmd FileType c,cpp set keywordprg=man\ -S\ 2:3

