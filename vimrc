" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#infect()
silent! call pathogen#incubate()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set nowrap						  " Disable line wrapping
nmap <silent> <leader>ww :set nowrap!<CR>

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
"set hlsearch                      " Highlight matches.

" avoid pause when hitting escape
set ttimeout
set ttimeoutlen=50

"set wrap                          " Turn on line wrapping.
" allow up/down navigation between wrapped lines
nmap <silent> j gj
nmap <silent> k gk
nmap <silent> <down> gj
nmap <silent> <up> gk
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,$HOME\_vim\tmp,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=4                    " Global tab width.
set shiftwidth=4                 " And again, related.
"set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Tab mappings.
"map <leader>tt :tabnew<cr>
"map <leader>te :tabedit
"map <leader>tc :tabclose<cr>
"map <leader>to :tabonly<cr>
"map <leader>tn :tabnext<cr>
"map <leader>tp :tabprevious<cr>
"map <leader>tf :tabfirst<cr>
"map <leader>tl :tablast<cr>
"map <leader>tm :tabmove

vmap <Tab> >gv
vmap <S-Tab> <gv
"nmap <S-Tab> <C-W><C-W>
" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" setup code folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=1
map zM :set foldlevel=1<CR>

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec
autocmd BufNewFile,BufRead *.csx set filetype=cs

" Toggle MakeGreen
"   For some odd reason, the initial autocmd for enabling needs to be run
"   twice. Disable it in between to in case attaching twice is a problem.
map <leader>tt :MakeGreen<CR>
map <leader>ts :!npm test<CR>
map <leader>te :autocmd BufWritePost *.js MakeGreen <CR> :autocmd! BufWritePost *.js MakeGreen <CR> :autocmd BufWritePost *.js MakeGreen<CR>
map <leader>td :autocmd! BufWritePost *.js MakeGreen<CR>

" navigation
map <leader>gg :TernDef<CR>
map <leader>gh :TernDocBrowse<CR>

" ease editing of .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

if !has("win32") || has("gui_win32")
	" use solarized dark colour scheme
	set background=dark
	colorscheme solarized
endif

" disable automatically changing to project root vim-rooter (use <leader>cd to get there)
let g:rooter_manual_only = 1

" FuzzySearch: exclude node_modules dir from fuzzy search
let g:fuf_dir_exclude = '\v(^|[/\\])(\.(hg|git|bzr))|(node_modules)|(build)($|[/\\])'
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])(\.(hg|git|bzr))|(build)|(node_modules)($|[/\\])'
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])(\.(hg|git|bzr))|(build)|(node_modules)($|[/\\])'

nnoremap <silent> <leader>sf :FufFile<CR>
nnoremap <silent> <leader>sc :FufCoverageFile<CR>
nnoremap <silent> <leader>sb :FufBuffer<CR>
nnoremap <silent> <leader>sq :FufQuickfix<CR>
nnoremap <silent> <leader>ss :Ggrep <cword><CR>

" Better Accented Character Support
inoremap <expr>  <C-K>   BDG_GetDigraph()

" enable mouse support in terminal
set mouse=a
