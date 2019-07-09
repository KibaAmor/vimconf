if (!(has("win32") || has("win64") || has("win95") || has("win16")))
    if (has("nvim"))
        if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
            silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
    else
        if empty(glob('~/.vim/autoload/plug.vim'))
            silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
    endif
endif


if (has("nvim"))
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'dkprice/vim-easygrep'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree',
Plug 'mbbill/fencview'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'

Plug 'ludovicchabant/vim-gutentags'
Plug 'w0rp/ale'
Plug 'junegunn/vim-easy-align'

Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/echodoc.vim'
Plug 'KibaAmor/YCM-Generator', { 'branch': 'stable'}
Plug 'skywind3000/asyncrun.vim'
Plug 'vhdirk/vim-cmake'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'
call plug#end()

