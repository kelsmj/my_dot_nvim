call plug#begin()
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-tern'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" For async completion
Plug 'Shougo/deoplete.nvim'
" For Denite features
Plug 'Shougo/denite.nvim'
Plug 'roxma/nvim-yarp'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'
Plug 'Quramy/vim-js-pretty-template'
Plug 'leafgarland/typescript-vim'
Plug 'othree/html5.vim'
Plug 'mileszs/ack.vim'
"Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'vimlab/split-term.vim'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:indent_guides_enable_on_vim_startup = 1

" When writing a buffer (no delay).
"call neomake#configure#automake('w')
" autocmd! BufWritePost,BufEnter * Neomake
"let g:neomake_open_list = 2
"let g:neomake_verbose = 3
"let g:neomake_logfile='/tmp/neo-error-1.log'
"let g:neomake_typescript_enabled_makers = ['tslint']

" Quramy
" autocmd FileType javascript JsPreTmpl html autocmd FileType typescript JsPreTmpl markdown
"autocmd FileType typescript syn clear foldBraces " For leafgarland/typescript-vim users only. Please see #1 for details.<Paste>

let g:deoplete#enable_at_startup = 1
"let g:nvim_typescript#diagnostics_enable = 0

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
set wildignore+=*/node_modules/*,*/jspm_packages/*,*/build/dist/*,*/tmp/*

" configure js-beautify
" autocmd FileType javascript setlocal equalprg=js-beautify\ -t\ -s\ 2\ -w\ 140\ -j\ --stdin
" set text formatting for python
autocmd Filetype python setlocal expandtab tabstop=2 shiftwidth=2
" set text formatting for javascript and html
" autocmd Filetype javascript setlocal noexpandtab tabstop=2 shiftwidth=2
" autocmd Filetype html setlocal noexpandtab tabstop=2 shiftwidth=2
"
" ----------------------------------------
" Commands
" ----------------------------------------

" Silently execute an external command
" No 'Press Any Key to Contiue BS'
" from: http://vim.wikia.com/wiki/Avoiding_the_%22Hit_ENTER_to_continue%22_prompts
command! -nargs=1 SilentCmd
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

" Fixes common typos
command! W w
command! Q q
" Trim trailing whitespace on save for .py files
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.ts :%s/\s\+$//e
" ---------------
" Color
" ---------------
"set background=dark
"colorscheme palenight
"let g:solarized_termcolors=256
" Force 256 color mode if available

"if $TERM =~ "-256color"
"   set t_Co=256
"endif
"if (has("termguicolors"))
" set termguicolors
"endif

" Theme
colorscheme OceanicNext
" -----------------------------
" File Locations
" -----------------------------
set backupdir=~/.vim/.backup// " Double // causes backups to use full file path
set directory=~/.vim/.tmp//
set spellfile=~/.vim/spell/custom.en.utf-8.add
" Persistent Undo
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/.undo
endif

" ---------------
" UI
" ---------------
set ruler          " Ruler on
set number         " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set encoding=utf-8
set noshowmode     " Don't show the mode since Powerline shows it
set title          " Set the title of the window in the terminal to the file
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently as a wrapping guide.
endif
" Disable tooltips for hovering keywords in Vim
if exists('+ballooneval')
  " This doesn't seem to stop tooltips for Ruby files
  set noballooneval
  " 100 second delay seems to be the only way to disable the tooltips
  set balloondelay=100000
endif

" ---------------
" Behaviors
" ---------------
syntax enable
set backup             " Turn on backups
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=1000     " Time to wait for a command (after leader for example).
set ttimeout
set ttimeoutlen=0    " Time to wait for a command (after leader for example).
set nofoldenable       " Disable folding entirely.
set foldlevelstart=99  " I really don't like folds.
set formatoptions=crql
set iskeyword+=\$,-   " Add extra characters that are valid parts of variables
set nostartofline      " Don't go to the start of the line after some commands
set scrolloff=3        " Keep three lines below the last line when scrolling
set gdefault           " this makes search/replace global by default
set switchbuf=useopen  " Switch to an existing buffer if one exists
set omnifunc=syntaxcomplete#Complete

" ---------------
" Text Format
" ---------------
set textwidth=158
set tabstop=2
set softtabstop=2
set backspace=indent,eol,start " Delete everything with backspace
set shiftwidth=2 " Tabs under smart indent
set shiftround
set cindent
set autoindent
set smarttab
set expandtab

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch  " Incremental search
set hlsearch   " Highlight search results
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc,*/node_modules/*,
  \rake-pipeline-*

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" Show invisible characters
set list
highlight LineNr ctermfg=grey

" Show trailing spaces as dots and carrots for extended lines.
" From Janus, http://git.io/PLbAlw

" Reset the listchars
set listchars=""
" make tabs visible
set listchars=tab:\ \
" set listchars=tab:▸▸
" show trailing spaces as dots
set listchars+=trail:•
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a    " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U
set completeopt-=preview

" ----------------------------------------
" Mappings
" ----------------------------------------
nmap <leader>p :setlocal paste! paste?<cr>
noremap <Up> <NOP>
noremap <Down> <NOP>
nnoremap <Left> @:
noremap <Right> <NOP>
nnoremap <S-tab> :tabprevious<CR>
inoremap <S-tab> <Esc>:tabprevious<CR>i
map <Esc>[1;2D :tabprevious<CR>
map <Esc>[1;2C :tabnext<CR>

nnoremap H gT
nnoremap L gt

nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gca :Gcommit -a -v<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
" Mnemonic, gu = Git Update
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
" Exit a diff by closing the diff window
nnoremap <Leader>gx :wincmd h<CR>:q<CR>
" Start git command
nnoremap <leader>gi :Git<space>
" Undo the last commit
command! Gcundo :Git reset HEAD~1
set diffopt=filler,vertical


set splitbelow

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {
      \  'typescript': ['tslint']
      \}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='molokai'

augroup typescript
    au!
    autocmd FileType typescript set colorcolumn=140
augroup END
