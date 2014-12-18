set nocompatible

call plug#begin()

Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'szw/vim-ctrlspace'

Plug 'bkad/CamelCaseMotion'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'myusuf3/numbers.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'chrisbra/changesPlugin'
Plug 'scrooloose/syntastic'

Plug 'Shougo/neocomplete.vim'

Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'

Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite-session'
Plug 'tsukkee/unite-help'

Plug 'dbext.vim'

Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'

Plug 'fatih/vim-go'

Plug 'elzr/vim-json'

call plug#end()


let mapleader = ','

" никаких таймаутов
set notimeout nottimeout

" гуй
set guioptions=cm
set guifont=PragmataPro\ 7.5
colorscheme vl

" отображение всякой инфы
set showcmd
set number
set hlsearch
set cursorline
set showmatch
set scroll=5
set scrolloff=15
set wildmenu wildmode=list:longest,full  " Show list instead of just completing

" долой тормоза
set lazyredraw

" селекшон регистр для копипаста
if has ('x11') && has ('gui')
    set clipboard=unnamed
endif


" инкрементальный поиск
set incsearch ignorecase smartcase

" tabs
set tabstop=4
set shiftwidth=4
set expandtab

" бэкапы и ундо
set backupdir=$HOME/.backups
set undodir=$HOME/.undos
set undofile
set noswapfile

" удаление вайтспейсов
autocmd BufWritePre * :%s/\s\+$//e

" обновление файла по C-s
nmap <c-s> :update<CR>
imap <c-s> <Esc><c-s>a

" ,; ставит ; в конце строки
nmap <leader>; m`A;<Esc>``

" закрываем скобки с помощью C-]
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


" Unite {

" немного хоткеев

nmap <silent> <space>f :<C-u>Unite -start-insert file/new file/async<CR>
nmap <silent> <space>F :<C-u>Unite -start-insert file/new file_rec/git file_rec/async<CR>
nmap <silent> <space>b :<C-u>Unite buffer<CR>
nmap <silent> <space>l :<C-u>Unite -start-insert line<CR>
nmap <silent> <space>o :<C-u>Unite outline<CR>

let g:unite_source_history_yank_enable = 1
nmap <silent> [unite]y :<C-u>Unite history/yank<CR>

" }

" ctrl-space {
set hidden
let g:ctrlspace_use_tabline = 1
let g:ctrlspace_default_mapping_key = '<space>s'
" }


" tcomment {
let g:tcommentMapLeaderOp1 = '<Leader>c'
let g:tcommentMapLeaderUncommentAnyway = '<Leader>c<'
let g:tcommentMapLeaderCommentAnyway = '<Leader>c>'
" }

" changes {
let g:changes_vcs_check = 1
" }

" Git {
nmap <space>gl :Gitv --all<CR>
nmap <space>gL :Gitv! --all<CR>
vmap <space>gL :Gitv! --all<CR>

let g:Gitv_CommitStep = 200
" }

" neocomplete {
let g:neocomplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" <CR>: close pum
inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"
" }

" C {
autocmd BufNewFile,BufRead *.h :set ft=c
autocmd FileType c setlocal equalprg=uncrustify\ -q\ -l\ c\ --frag
" }

" Python {
autocmd FileType python setlocal equalprg=autopep8\ -a\ --max-line-length=120\ -
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" }

" OCaml {
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "set rtp+=" . g:opamshare . "/vim"
autocmd FileType ocaml setlocal tabstop=2 shiftwidth=2
autocmd FileType ocaml setlocal equalprg=ocp-indent\ --syntax=lwt
autocmd FileType ocaml nmap <buffer> <leader>t <Plug>(ocpindex-echo-type)
" }
