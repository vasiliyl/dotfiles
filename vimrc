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
set shiftwidth=0

if has ('x') && has ('gui') " On Linux use + register for copy-paste
    set clipboard=unnamedplus
elseif has ('gui')          " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
endif


" обновление файла по C-s
nmap <c-s> :update<CR>
imap <c-s> <Esc><c-s>a

set number

" Backups {
" TODO
" }

" UI {
set cursorline                  " Highlight current line
set showmatch                   " Show matching brackets/parenthesis
set incsearch ignorecase hlsearch
set wildmenu wildmode=list:longest,full  " Show list instead of just completing

set scroll=5
set scrolloff=15
" }


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
"} 


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

