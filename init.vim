set nocompatible

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin()

" Plug 'Shougo/context_filetype.vim'
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/neomru.vim'
" Plug 'Shougo/neosnippet'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/unite-session'
" Plug 'Shougo/vimfiler.vim'
" Plug 'Shougo/vimshell.vim'
" Plug 'Twinside/vim-syntax-haskell-cabal'
" Plug 'Yggdroot/indentLine'
" Plug 'bitc/vim-hdevtools'
" Plug 'chrisbra/changesPlugin
" Plug 'eagletmt/ghcmod-vim'
" Plug 'eagletmt/neco-ghc'
" Plug 'elzr/vim-json'
" Plug 'enomsg/vim-haskellConcealPlus'
" Plug 'fatih/vim-go'
" Plug 'gregsexton/gitv'
" Plug 'junegunn/vim-easy-align'
" Plug 'kmnk/vim-unite-giti'
" Plug 'ledger/vim-ledger'
" Plug 'lyuts/vim-rtags'
" Plug 'mattn/emmet-vim'
" Plug 'mbbill/undotree'
" Plug 'osyo-manga/unite-quickfix'
" Plug 'raichoo/purescript-vim'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'tsukkee/unite-help'
" Plug 'ujihisa/repl.vim'
" Plug 'ujihisa/unite-haskellimport'
" Plug 'wellle/targets.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/tabpagebuffer.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'benekastah/neomake'
Plug 'bkad/CamelCaseMotion'
Plug 'jreybert/vimagit'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'kshenoy/vim-signature'
Plug 'myusuf3/numbers.vim'
Plug 'rstacruz/vim-closer'
Plug 'scrooloose/nerdcommenter'
Plug 'tacroe/unite-mark'
Plug 'thinca/vim-unite-history'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'triglav/vim-visual-increment'

call plug#end()


" common {

let mapleader = ','

" никаких таймаутов
set notimeout nottimeout

" гуй
set guioptions=cm
set guifont=PragmataPro\ 7
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
" ,, ставит , в конце строки
nmap <leader>, m`A,<Esc>``

" скачем по буферам с контролои
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l

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

" консилим всё, что задефайнено, но текущую строку анконсилим
set conceallevel=1
set concealcursor="nc"

set clipboard+=unnamedplus

" }


" Unite {

call unite#custom#profile('default', 'context', { 'winheight': 60, 'vertical_preview': 1 })

function! s:unite_settings() " {{{
    nmap <buffer> <C-j> j
    nmap <buffer> <C-k> k
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)

    nmap <silent><buffer> { <Plug>(unite_rotate_previous_source)
    imap <silent><buffer> <C-{> <Plug>(unite_rotate_previous_source)
    nmap <silent><buffer> } <Plug>(unite_rotate_next_source)
    imap <silent><buffer> <C-}> <Plug>(unite_rotate_next_source)

    nmap <silent><buffer><expr> s unite#do_action('split')
    nmap <silent><buffer><expr> v unite#do_action('vsplit')
endfunction " }}}

autocmd FileType unite call s:unite_settings()

" немного хоткеев

nmap <silent> <space><space> :<C-u>Unite -start-insert<CR>
nmap <silent> <space>b :<C-u>Unite -buffer-name=buffers -start-insert -auto-preview buffer_tab buffer<CR>
nmap <silent> <space>t :<C-u>Unite -start-insert tab<CR>
nmap <silent> <space>f :<C-u>Unite -start-insert file_rec/neovim2 file/new<CR>
nmap <silent> <space>H :<C-u>Unite history/command<CR>
nmap <silent> <space>l :<C-u>Unite -start-insert line<CR>
nmap <silent> <space>L :<C-u>Unite quickfix location_list<CR>
nmap <silent> <space>m :<C-u>Unite mark<CR>
nmap <silent> <space>o :<C-u>Unite outline<CR>

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--vimgrep --nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''

let g:unite_source_history_yank_enable = 1
nmap <silent> <space>p :<C-u>Unite history/yank<CR>

" }


" deoplete {
let g:deoplete#enable_at_startup = 1
" }

" " ctrl-space {
" set hidden
" let g:ctrlspace_use_tabline = 1
" let g:ctrlspace_default_mapping_key = '<space>s'
" " }


" folding {
set foldmethod=syntax
set foldlevelstart=99
set foldopen=search
set foldcolumn=1
" }


" signature - m. mX etc{
let g:SignatureMarkTextHL="'MarksColumn'"
" }


" " changes {
" let g:changes_vcs_check = 1
" " }

" easymotion {
nmap s <Plug>(easymotion-s2)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
let g:EasyMotion_smartcase = 1
" }


" replace {
map R <Plug>(operator-replace)
" }


" отображение вайтспейсов и индентов {
set list
" set listchars=tab:˪\ ,eol:˼,trail:·
set listchars=tab:؞\ ,eol:\ ,trail:·
let g:indentLine_char = '⋮'
let g:indentLine_setColors = 0
" никаких автоустановок переменных
let g:indentLine_noConcealCursor = 1
" }


" " Git {
" nmap <space>gb :<C-u>Unite giti/branch<CR>
" nmap <space>gl :<C-u>Unite giti/log<CR>
" nmap <space>gs :<C-u>Unite giti/status<CR>
" " }


" " neocomplete {
" let g:neocomplete#enable_at_startup = 1
" " <CR>: close popup and send <CR>
" inoremap <silent> <CR> <C-r>=<SID>neocomplete_cr_function()<CR>
" function! s:neocomplete_cr_function()
"   return neocomplete#close_popup() . "\<CR>"
" endfunction
" " <TAB>: completion.
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" " }

" C {
autocmd FileType c setlocal equalprg=uncrustify\ -q\ -l\ c\ --frag
" rtags
"autocmd FileType c nmap <buffer> <space>ci :call rtags#SymbolInfo()<CR>
"autocmd FileType c nmap <buffer> <space>cj :call rtags#JumpTo()<CR>
"autocmd FileType c nmap <buffer> <space>cp :<C-u>Unite -auto-preview rtags/project<CR>
"autocmd FileType c nmap <buffer> <space>cr :<C-u>Unite -auto-preview rtags/references<CR>
"autocmd FileType c nmap <buffer> <space>cs :<C-u>Unite rtags/symbol<CR>
" }

" CPP {
autocmd FileType cpp setlocal equalprg=uncrustify\ -q\ -l\ cpp\ --frag
"autocmd FileType cpp nmap <buffer> <space>ci :call rtags#SymbolInfo()<CR>
"autocmd FileType cpp nmap <buffer> <space>cj :call rtags#JumpTo()<CR>
"autocmd FileType cpp nmap <buffer> <space>cp :<C-u>Unite -auto-preview rtags/project<CR>
"autocmd FileType cpp nmap <buffer> <space>cr :<C-u>Unite -auto-preview rtags/references<CR>
"autocmd FileType cpp nmap <buffer> <space>cs :<C-u>Unite rtags/symbol<CR>
" }

" Haskel {
autocmd FileType haskell
    \ let b:closer = 1 |
    \ let b:closer_flags = '([{'

"autocmd FileType haskell nmap <buffer> <space>hi :<C-u>Unite -start-insert haskellimport<CR>

"autocmd FileType haskell nmap <buffer> <leader>hc :<C-u>GhcModTypeClear<CR>
"autocmd FileType haskell nmap <buffer> <leader>hi :<C-u>GhcModInfoPreview!<CR>
"autocmd FileType haskell nmap <buffer> <leader>ht :<C-u>GhcModType!<CR>
"autocmd FileType haskell nmap <buffer> <leader>hT :<C-u>GhcModTypeInsert!<CR>
" }

