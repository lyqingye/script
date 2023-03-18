" plugin manager
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc-rls'
Plug 'kevinhwang91/rnvimr'
Plug 'sebdah/vim-delve'
Plug 'puremourning/vimspector' 
Plug 'mhinz/vim-startify' 
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" Plug 'glepnir/dashboard-nvim'
Plug 'glepnir/oceanic-material'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes'

Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'andymass/vim-matchup' 
Plug 'tpope/vim-commentary'
Plug 'josa42/coc-sh'

" Plug 'elixir-editors/vim-elixir'
" Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

" Plug 'neovim/nvim-lspconfig'
" Plug 'simrat39/rust-tools.nvim'

" Optional dependencies
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" go config
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" generic config
set number
syntax on
set relativenumber
set background=dark 
set fillchars+=vert:\ 
colorscheme oceanic_material 
autocmd! ColorScheme * hi VertSplit ctermbg=none 
set encoding=UTF-8

imap jj <ESC>
nnoremap k gk
nnoremap j gj
nnoremap gj j  
nnoremap gk k

" config for vim go
let g:go_auto_type_info = 1


" config for rainbow
let g:rainbow_active = 1

" config for dashboard
let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f h',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC c n',
\ 'change_colorscheme' : 'SPC t c',
\ 'find_word'          : 'SPC f a',
\ 'book_marks'         : 'SPC f b',
\ }

" config for rnvimr
nnoremap - :RnvimrToggle<CR>
let g:rnvimr_action = {
            \ '<C-h>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit'
            \ }
" config for vimspector 
let g:vimspector_enable_mappings = 'HUMAN' 

" config for airline 
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_tabs = 1     
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
nmap <Tab>1  <C-\><C-n><Plug>AirlineSelectTab1
nmap <Tab>2  <C-\><C-n><Plug>AirlineSelectTab2
nmap <Tab>3  <C-\><C-n><Plug>AirlineSelectTab3
nmap <Tab>4  <C-\><C-n><Plug>AirlineSelectTab4
nmap <Tab>5  <C-\><C-n><Plug>AirlineSelectTab5
nmap <Tab>6  <C-\><C-n><Plug>AirlineSelectTab6
nmap <Tab>7  <C-\><C-n><Plug>AirlineSelectTab7
nmap <Tab>8  <C-\><C-n><Plug>AirlineSelectTab8
nmap <Tab>9  <C-\><C-n><Plug>AirlineSelectTab9

" config for nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window left.
autocmd StdinReadPre * let s:std_in=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" config for nerdtree-git
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

" config for coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs :CocList -I symbols<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
highlight Normal guibg=NONE ctermbg=None


" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.4, 'height': 0.5 } }


" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:go_term_enabled=1
