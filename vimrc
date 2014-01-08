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

set showcmd

set undodir=$HOME/.undos
set undofile

set scroll=5
set scrolloff=15

set tabstop=4
set shiftwidth=0

set incsearch hlsearch


" обновление файла по C-s
nmap <c-s> :update<CR>
imap <c-s> <Esc><c-s>a

set number

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

