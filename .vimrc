source ~/.vimrc.gentoo

map <Space> <C-F>
map <BackSpace> <C-B>
map ; $
set showmatch
set laststatus=2
set smartindent
set shiftwidth=4
set softtabstop=4
set lbr
set hls "hightlight search
set backspace=indent,eol,start
set ruler
set showcmd
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1

filetype plugin indent on
syntax on
set number

call plug#begin('~/.vim/plugged')
    Plug 'pangloss/vim-javascript'    " JavaScript support
    Plug 'leafgarland/typescript-vim' " TypeScript syntax
    Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
    Plug 'jparise/vim-graphql'        " GraphQL syntax
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"    Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
call plug#end()
let g:coc_global_extensions = [ 'coc-tsserver' ]
