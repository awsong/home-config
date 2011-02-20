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
syntax on
set backspace=indent,eol,start
set ruler
set showcmd
set cst
cs add cscope.out
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>
filetype plugin indent on
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
set tags+=/var/tmp/portage/openipmi-1.4.14/work/OpenIPMI-1.4.14/tags
colorscheme desert
