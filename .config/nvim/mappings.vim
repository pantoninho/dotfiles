" doc this
nnoremap <silent> <leader>doc :CocCommand docthis.documentThis<CR>
" toggle terminal using coc
nmap <silent> <leader><space> <Plug>(coc-terminal-toggle)
" escape to exit terminal
tnoremap <Esc> <C-\><C-n>
" CTRL+B to open NERDTree
map <silent> <C-b> :NERDTreeToggle<CR>
" open FZF for file search
map <silent> <C-p> :Files<CR>
" open Ag for text searching
map <silent> <C-f> :Ag<CR>

" coc mappings
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C-w>d :call CocAction('jumpDefinition', 'vsplit')<CR>
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Symbol renaming.
nmap <F2> <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <silent> <leader>f  :call CocAction('format')<CR>
" Use vv for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> vv <Plug>(coc-range-select)
xmap <silent> vv <Plug>(coc-range-select)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Show signature help on placeholder jump
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
