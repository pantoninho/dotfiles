set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
set shell=/usr/local/bin/fish
packadd! matchit
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'wellle/visual-split.vim'
Plug 'justinmk/vim-sneak'
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

set termguicolors
colorscheme base16-eighties
set noshowmode
set signcolumn=yes
set clipboard=unnamed
set number relativenumber

" add .js suffixes on files? useful for navigating between js requires
set suffixesadd+=.js
" split from right to left and bottom to top
set splitbelow
set splitright

set scrolloff=5


let g:javascript_plugin_jsdoc = 1

" NERDTree configs
let NERDTreeShowHidden = 1

" enable airline tabline extension (buffer tab bar)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" asciidoctor-vim configs
" " Fold sections, default `0`.
let g:asciidoctor_folding = 1
" Fold options, default `0`.
let g:asciidoctor_fold_options = 1
" Conceal *bold*, _italic_, `code` and urls in lists and paragraphs, default `0`.
" See limitations in end of the README
let g:asciidoctor_syntax_conceal = 1
" Highlight indented text, default `1`.
let g:asciidoctor_syntax_indented = 0
" List of filetypes to highlight, default `[]`
let g:asciidoctor_fenced_languages = ['python', 'c', 'javascript']
" What to use for HTML, default `asciidoctor`.
let g:asciidoctor_executable = 'asciidoctor'
" What extensions to use for HTML, default `[]`.
let g:asciidoctor_extensions = ['asciidoctor-diagram', 'asciidoctor-rouge']
" Path to the custom css
let g:asciidoctor_css_path = '~/docs/AsciiDocThemes'
" Custom css name to use instead of built-in
let g:asciidoctor_css = 'haba-asciidoctor.css'
" What to use for PDF, default `asciidoctor-pdf`.
let g:asciidoctor_pdf_executable = 'asciidoctor-pdf'
" What extensions to use for PDF, default `[]`.
let g:asciidoctor_pdf_extensions = ['asciidoctor-diagram']
" Path to PDF themes, default `''`.
let g:asciidoctor_pdf_themes_path = '~/docs/AsciiDocThemes'
" Path to PDF fonts, default `''`.
let g:asciidoctor_pdf_fonts_path = '~/docs/AsciiDocThemes/fonts'

augroup ON_ASCIIDOCTOR_SAVE | au!
    au BufWritePost *.adoc :Asciidoctor2HTML
augroup end

" coc recommended settings
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

" Disable indentlines for helpfiles
autocmd FileType help,fzf,nerdtree IndentLinesDisable
" indentline config
let g:indentLine_setColors = 0
let g:indentLine_setConceal = 0
