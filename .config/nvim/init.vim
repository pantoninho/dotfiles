" vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" set default shell for builtin terminal - use fish shell
set shell=/usr/local/bin/fish

" plugins
packadd! matchit
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'wellle/visual-split.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-dispatch'
Plug 'sheerun/vim-polyglot'
Plug 'habamax/vim-asciidoctor'
Plug 'pantharshit00/vim-prisma'
call plug#end()

source ~/.config/nvim/mappings.vim

" use terminal colors
set termguicolors
" set colorscheme from base16 themes collection
colorscheme base16-eighties
" do not show vim input mode (airline already shows this)
set noshowmode
" always show sign column before the numbers
set signcolumn=yes
" use system clipboard
set clipboard=unnamed
" use relative line numbers (todo: vim-numbertoggle already solves this?)
set number relativenumber
" add .js suffixes on files. useful for navigating between js requires
set suffixesadd+=.js
" split from left to right and top to bottom
set splitbelow
set splitright
" always have 5 lines below or on top of cursor
set scrolloff=5

" syntax highlight jsdocs
let g:javascript_plugin_jsdoc = 1

" NERDTree configs
let NERDTreeShowHidden = 1

" coc recommended settings
" highlight symbol on cursor hold
autocmd CursorHold * silent call CocActionAsync('highlight')
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Setup formatexpr specified filetype(s).
autocmd FileType javascript,typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
