set nocompatible

" Vundle {
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'


" General {
Bundle 'two2tango'
Bundle 'mbbill/undotree'
Bundle 'YankRing.vim'
Bundle 'bkad/CamelCaseMotion'
Bundle 'tpope/vim-surround'
Bundle 'myusuf3/numbers.vim'
Bundle 'paradigm/SkyBison'
Bundle 'scrooloose/nerdcommenter'
Bundle 'szw/vim-ctrlspace' 
Bundle 'tommcdo/vim-exchange'
"Bundle 'itchyny/lightline.vim'
Bundle 'repmo.vim'

Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'Shougo/neosnippet-snippets'
" }

" C {
"Bundle 'justmao945/vim-clang'
" }


" Go {
Bundle 'jnwhiteh/vim-golang'
Bundle 'Blackrush/vim-gocode'
" }

" HTML {
Bundle 'mattn/emmet-vim'
" }

" Misc {
Bundle 'DrawIt'
" }

" }


" General {

let mapleader = ','

filetype plugin indent on
syntax on

set guioptions=m
colorscheme two2tango
set guifont="Consolas"

set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing

set showcmd

set undodir=$HOME/.undos
set undofile

set tabstop=4
set shiftwidth=4

if has ('x') && has ('gui') " On Linux use + register for copy-paste
    set clipboard=unnamedplus
elseif has ('gui')          " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
endif


" обновление файла по C-s
nmap <c-s> :update<CR>
imap <c-s> <Esc><c-s>a

set number


nmap S cc

" Backups {
" TODO
" }

" UI {
set cursorline                  " Highlight current line
set showmatch                   " Show matching brackets/parenthesis
set incsearch ignorecase smartcase hlsearch
set wildmenu wildmode=list:longest,full  " Show list instead of just completing

set scroll=5
set scrolloff=15
" }


" }

" lightline {
"set laststatus=2
"let g:lightline = {
"            \ 'colorscheme': 'jellybeans',
"            \ 'active': { 
"            \ 'left': [['mode'], ['filename'], ['myfunc']],
"            \ 'component_function': {
"            \ 'myfunc': 'MyFunc',
"            \ },
"            \ },
"            \ }

"\   'cs_info': 'ctrlspace#statusline_info_segment',
"\   'cs_key_info': 'ctrlspace#statusline_key_info_segment',

"\ 'right':	[['cs_info'], ['cs_key_info']],
" }


" ctrlspace {
set hidden
let g:ctrlspace_default_mapping_key = '<leader>s'
" }



" neocomplete {
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 30
let g:neocomplete#disable_auto_complete = 1
let g:neocomplete#enable_smart_case = 1

inoremap	<expr><C-j>	neocomplete#start_manual_complete()
inoremap	<expr><C-h>	neocomplete#close_popup()
inoremap 	<expr><C-g>	neocomplete#undo_completion()
" }

" neosnippet {
let g:neosnippet#enable_preview = 1

imap <C-k>     <Plug>(neosnippet_expand)
imap <C-n>     <Plug>(neosnippet_jump)
" }


" Uncrustify {
" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

" Specify path to your Uncrustify configuration file.
let g:uncrustify_cfg_file_path =
    \ shellescape(fnamemodify('~/.uncrustify.cfg', ':p'))

" Don't forget to add Uncrustify executable to $PATH (on Unix) or 
" %PATH% (on Windows) for this command to work.
function! Uncrustify(language)
  call Preserve(':silent %!uncrustify'
      \ . ' -q '
      \ . ' -l ' . a:language
      \ . ' -c ' . g:uncrustify_cfg_file_path)
endfunction
" } 


" C {
autocmd FileType c autocmd BufWritePre <buffer> :call Uncrustify('c')
" }

" Go {
autocmd FileType go setlocal noexpandtab
autocmd FileType go autocmd BufWritePre <buffer> Fmt
" }

" вместо автоматического закрытия скобок используем C-] {
let g:autoclose_on = 0
 
" http://stackoverflow.com/questions/6080286/vim-magic-closing-bracket
" Return a corresponding paren to be sent to the buffer
function! CloseParen()
    let parenpairs = {'(' : ')',
                   \  '[' : ']',
                   \  '{' : '}'}

    let [m_lnum, m_col] = searchpairpos('[[({]', '', '[\])}]', 'nbW')

    if (m_lnum != 0) && (m_col != 0)
        let c = getline(m_lnum)[m_col - 1]
        return parenpairs[c]
    endif
    return ''
endfun

imap <C-]> <C-r>=CloseParen()<CR>
" }

