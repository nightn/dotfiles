set enc=utf-8
source $VIMRUNTIME/vimrc_example.vim

let mapleader = "\<space>"

" 基础配置
set fileencodings=ucs-bom,utf-8,gb18030,latin1   " 文件编码
syntax on   " 语法高亮
set nu hls is   " 显示行号 搜索高亮 增量搜索
" tab 与缩进
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent

set cc=120   " 最大行宽
set updatetime=100   " 刷新时间
" 仅在真彩色终端下开启
set termguicolors

set hidden

nnoremap <leader>a :call SyntaxAttr()<cr>

" allow json comment
"autocmd FileType json syntax match Comment +\/\/.\+$+

" fast mapping keys
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" find all tailing whitespace
nnoremap <leader>w /\v\s+$<cr>
" delete all tailing whitespace
nnoremap <leader>W :%s/\v\s+$//g \| noh<cr>
" move current line down
nnoremap - ddp
" move current line up
nnoremap _ ddkkp
" uppercase current word in insert mode
inoremap <c-u> <esc>viwUea
" abbrev for typos
iabbrev adn and
" surround the word in double quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" surround the word in single quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" a faster way to return to normal mode
inoremap jk <esc>
" run current vimscript file
nnoremap <leader>r :source %<cr>
" split previous buffer on right side
nnoremap <leader>v :execute "rightbelow vs " . bufname("#")<cr>
" add ; at end of current line. not work for now
nnoremap <leader>; :execute "normal! mqA;\<esc>`q"
" Toggling
nnoremap <leader>N :setlocal number!<cr>
" close Quickfix Location Preview Help
nnoremap <leader>q :cclose \| lclose \| pclose \| helpclose<cr>

inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap < <><left>

" disable arrow keys
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

autocmd FileType def :set ft=cpp

" 禁止backup功能，设置undo文件路径
set nobackup
set undodir=~/.vim/undodir
if !isdirectory(&undodir)
  call mkdir(&undodir, 'p', 0700)
endif

" 启用 man 插件
source $VIMRUNTIME/ftplugin/man.vim

if has('mouse')
  if has('gui_running') || (&term =~ 'xterm' && !has('mac'))
    set mouse=a
  else
    set mouse=nvi
  endif
endif

nnoremap <silent> [b :bp<cr>
nnoremap <silent> ]b :bn<cr>
nnoremap <silent> [B :bfirst<cr>
nnoremap <silent> ]B :blast<cr>

nnoremap <silent> [q :cp<cr>
nnoremap <silent> ]q :cn<cr>
nnoremap <silent> [Q :cfirst<cr>
nnoremap <silent> ]Q :clast<cr>

" shut down vibrate of termux
" set vb

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Declare the list of plugins.
Plug 'Valloric/YouCompleteMe'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mg979/vim-visual-multi'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'skywind3000/vim-terminal-help'
" python
Plug 'python-mode/python-mode'
" syntax
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/jsonc.vim'
" colorscheme
Plug 'flazz/vim-colorschemes'
Plug 'doums/darcula'
Plug 'arzg/vim-colors-xcode'
Plug 'NLKNguyen/papercolor-theme'
Plug 'arzg/vim-colors-xcode'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" let H and L more reasonable
set scrolloff=1

" 取消括号匹配高亮
"let loaded_matchparen=1

" for xcodelight
let g:xcodelight_emph_funcs = 1
let g:xcodelight_emph_idents = 1
let g:xcodelight_green_comments = 1
let g:xcodelight_match_paren_style = 1

" dark theme
set background=dark
colorscheme darcula

" light theme
"set background=light
"colorscheme xcodelight

"colorscheme shine
"colorscheme PaperColor

let g:airline_theme = 'atomic'

" airline config
"let g:airline#extensions#whitespace#checks = [ 'trailing', 'long', 'conflicts', 'mixed-indent-file', 'indent' ]
let g:airline#extensions#whitespace#checks =
  \ [ 'trailing', 'long' ]

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tagbar#flags = 'f' "show full tag hierarchy

" tagbar auto open
autocmd FileType c,cpp,javascript,python nested :TagbarOpen
let g:airline#extensions#tagbar#searchmethod = 'scoped-stl'

" fzf
" :Files
nnoremap <c-p> :Files<cr>
nnoremap <leader>b :Buffers<cr>

let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'
" This is for termux ycm
" let g:ycm_clangd_binary_path = '/data/data/com.termux/files/usr/bin/clangd'

" 用于 YouCompleteMe 的设定
let g:ycm_extra_conf_globlist = ['~/repo/*', '~/tools/ycm/*', '~/.vim/plugged/YouCompleteMe/*']
let g:ycm_max_diagnostics_to_display = 0  " 不对ycm显示的告警数量做限制
let g:airline#extensions#ycm#enabled = 1  " filetype man has problem
let g:airline#extensions#ycm#error_symbol = 'E:'
set completeopt-=preview
let g:ycm_auto_hover = ''
let g:ycm_complete_in_comments = 1
let g:ycm_filetype_whitelist = {
      \ 'c': 1,
      \ 'cpp': 1,
      \ 'java': 1,
      \ 'python': 1,
      \ 'vim': 1,
      \ 'sh': 1,
      \ 'zsh': 1,
      \ 'javascript': 1,
      \ 'typescript': 1,
      \ }
" let g:ycm_goto_buffer_command = 'split-or-existing-window'
let g:ycm_key_invoke_completion = '<C-Z>'
nnoremap <leader>fi :YcmCompleter FixIt<cr>
nnoremap <leader>gt :YcmCompleter GoTo<cr>
nnoremap <leader>gd :YcmCompleter GoToDefinition<cr>
nnoremap <leader>gh :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>gr :YcmCompleter GoToReferences<cr>
nnoremap <leader>gs :YcmCompleter GoToSymbol<Space>
nnoremap <leader>d :YcmDiags<cr>
nmap <leader>fw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>fd <Plug>(YCMFindSymbolInDocument)

"set tags=./tags;,tags,/usr/local/etc/systags

" note
" paste on termux vim ctrl + Alt + V (insert mode)

" 支持在Visual模式下，通过C-y复制到系统剪切板
vnoremap <C-c> "+y
" 支持在normal模式下，通过C-p粘贴系统剪切板
"nnoremap <C-p> "*p

