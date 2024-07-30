" vim-bootstrap 2020-11-11 00:06:51

" Install Vim-Plug if not already installed
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable('curl')
    echoerr "You need to install curl or install vim-plug manually!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  silent exec "!curl -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

" Plugins
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'jelera/vim-javascript-syntax'
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

" Basic Setup
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set fileformats=unix,dos,mac
set shell=$SHELL
set ruler
set number
colorscheme dracula
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10
set laststatus=2
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Airline Configuration
let g:airline_theme = 'dracula'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" NERDTree Configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" Grep Configuration
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" Terminal
nnoremap <silent> <leader>sh :terminal<CR>

" Custom Commands
command! FixWhitespace :%s/\s\+$//e

" Mappings
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <leader>. :lcd %:p:h<CR>
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
nmap <leader>y :History:<CR>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
let g:ale_linters = {}
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
set noerrorbells visualbell t_vb=
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>
if has('macunix')
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>
noremap <leader>c :bd<CR>
nnoremap <silent> <leader><space> :noh<cr>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
vmap < <gv
vmap > >gv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <Leader>o :.Gbrowse<CR>

" Language Specific Settings
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType go nmap <Leader>dd <Plug>(go-def-vertical)
autocmd FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
autocmd FileType go nmap <Leader>db <Plug>(go-doc-browser)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
autocmd FileType go nmap <C-g> :GoDecls<cr>
autocmd FileType go nmap <leader>dr :GoDeclsDir<cr>
autocmd FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
autocmd FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
autocmd FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>
let g:javascript_enable_domhtmlcss = 1
autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79 formatoptions+=croq softtabstop=4 cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0
let g:yats_host_keyword = 1

" Autocmd Rules
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END
augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
if v:version > 703 || v:version == 703 && has('patch598')
  autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
endif

set autoread

" Functions
function! s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=79
endfunction

" Snippets Configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" Ale Configuration
let g:ale_linters = {'go': ['golint', 'go vet'], 'python': ['flake8']}

" Custom Vim-Airline Configuration
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep = '▶'
  let g:airline_left_alt_sep = '»'
  let g:airline_right_sep = '◀'
  let g:airline_right_alt_sep = '«'
  let g:airline#extensions#branch#prefix = '⤴'
  let g:airline#extensions#readonly#symbol = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol = 'ρ'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
