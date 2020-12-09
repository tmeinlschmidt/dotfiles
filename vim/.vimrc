execute pathogen#infect()
syntax on
filetype plugin indent on
set paste
set laststatus=2

map ^[[H <Home>
imap ^[[H <Home>
map ^[[F <End>
imap ^[[F <End>

set nocompatible
set bs=2
set ai

set secure
set history=100
set ignorecase
set showmatch
set visualbell
set exrc
set ruler
set showcmd
set smarttab
set smartindent
filetype on
set number

set nobomb
set nowrap
set foldmethod=marker
set viminfo='20,\"50

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,latin-2

set ts=2
set sw=2

let g:airline_powerline_fonts = 1

" my functions
fun! FixAnsibleParenthesis()
  :silent! %s/{{\([^ ]\)/{{ \1/g
  :silent! %s/\([^ ]\)}}/\1 }}/g
endfun
map f{ :call FixAnsibleParenthesis() <CR>

" vim-gitgutter settings
set updatetime=100
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" json formatting
nmap =j :%!python -m json.tool<CR>

" ctags
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_ansible = {
  \ 'ctagstype' : 'ansible',
  \ 'kinds' : [
    \ 't:tasks'
  \ ],
  \ 'sort' : 0
\ }

let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" kite
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set completeopt+=preview
autocmd CompleteDone * if !pumvisible() | pclose | endif
set belloff+=ctrlg
"KiteDisableEditorMetrics

autocmd BufWritePre * StripWhitespace
" syntastics
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_yaml_checkers = ['yamllint']

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" colorscheme
colorscheme railscasts
set background=dark

" Intent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_space_guides=2
let g:indent_guides_enable_on_vim_startup=1

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=black

"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgrey
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1
