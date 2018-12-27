"----------------------------------------------
" Plugin management
"
" Download vim-plug from the URL below and follow the installation
" instructions:
" https://github.com/junegunn/vim-plug
"----------------------------------------------
call plug#begin('~/.vim/plugged')

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction


" Dependencies
Plug 'Shougo/neocomplcache'        " Depenency for Shougo/neosnippet
Plug 'godlygeek/tabular'           " This must come before plasticboy/vim-markdown
Plug 'tpope/vim-rhubarb'           " Depenency for tpope/fugitive

" General plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'  " Default snippets for many languages
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ctrlpvim/ctrlp.vim'          " CtrlP is installed to support tag finding in vim-go
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/calendar.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'rbgrouleff/bclose.vim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sebdah/vim-delve'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'dkprice/vim-easygrep'
Plug 'vim-scripts/ZoomWin'
Plug 'vim-scripts/auto-pairs-gentle'
Plug 'francoiscabrol/ranger.vim'
Plug 'powerline/powerline'
Plug 'conradirwin/vim-bracketed-paste'
Plug 'roxma/vim-tmux-clipboard'
Plug 'ervandew/supertab'
Plug 'janko-m/vim-test'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }


" Vim only plugins
if !has('nvim')
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}  " Needed to make sebdah/vim-delve work on Vim
    Plug 'Shougo/vimshell.vim'                  " Needed to make sebdah/vim-delve work on Vim
endif

" Language support
Plug 'aklt/plantuml-syntax'                    " PlantUML syntax highlighting
Plug 'cespare/vim-toml'                        " toml syntax highlighting
Plug 'chr4/nginx.vim'                          " nginx syntax highlighting
Plug 'dag/vim-fish'                            " Fish syntax highlighting
Plug 'digitaltoad/vim-pug'                     " Pug syntax highlighting
Plug 'fatih/vim-go'                            " Go support
Plug 'vim-syntastic/syntastic'
Plug 'fishbullet/deoplete-ruby'                " Ruby auto completion
Plug 'tpope/vim-rails'                         " Rails
Plug 'lucapette/vim-ruby-doc'                  " Rails and Ruby Doc
Plug 'ecomba/vim-ruby-refactoring'             " Ruby refactor
Plug 'hashivim/vim-terraform'                  " Terraform syntax highlighting
Plug 'kchmck/vim-coffee-script'                " CoffeeScript syntax highlighting
Plug 'kylef/apiblueprint.vim'                  " API Blueprint syntax highlighting
Plug 'leafgarland/typescript-vim'              " TypeScript syntax highlighting
Plug 'lifepillar/pgsql.vim'                    " PostgreSQL syntax highlighting
Plug 'mxw/vim-jsx'                             " JSX syntax highlighting
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' } " Go auto completion
Plug 'pangloss/vim-javascript'                 " JavaScript syntax highlighting
Plug 'plasticboy/vim-markdown'                 " Markdown syntax highlighting
Plug 'rodjek/vim-puppet'                       " Puppet syntax highlighting
Plug 'tclh123/vim-thrift'                      " Thrift syntax highlighting
Plug 'zchee/deoplete-go', { 'do': 'make'}      " Go auto completion
Plug 'zchee/deoplete-jedi'                     " Go auto completion
Plug 'AndrewRadev/splitjoin.vim'               " Split or join Structs
Plug 'killphi/vim-legend'                      " Mark up code coverage
Plug 'thanethomson/vim-jenkinsfile'            " Mark up jenkins syntax

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'felixhummel/setcolors.vim'

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0 " fix funny cursor in linux
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set clipboard+=unnamedplus
set colorcolumn=126               " highlight the 125th column as an indicator
set completeopt-=preview          " remove the horrendous preview window
set cursorline                    " highlight the current line for the cursor
set encoding=utf-8
set expandtab                     " expands tabs to spaces
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set number                        " show number ruler
set relativenumber                " show relative numbers in the ruler
set ruler
set formatoptions=tcqronj         " set vims text formatting options
set softtabstop=2
set tabstop=2
set title                         " let vim set the terminal title
set updatetime=100                " redraw the status bar often
set noshowmode                    " get rid of INSERT so function signature shwos correct
set shortmess+=c                  " remove the match 1 of X


" neovim specific settings
if has('nvim')
    " Set the Python binaries neovim is using. Please note that you will need to
    " install the neovim package for these binaries separately like this for
    " example:
    " pip3.6 install -U neovim
    " let g:python_host_prog = '/usr/local/bin/python2'
    " let g:python3_host_prog = '/usr/local/bin/python3'
endif

" Enable mouse if possible
if has('mouse')
    set mouse=a
endif

" Allow vim to set a custom font or color for a word
if !exists("g:syntax_on")
    syntax enable
endif

" Set the leader button
let mapleader = ','

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Center the screen quickly
nnoremap <space> zz

"----------------------------------------------
" Clipper
"----------------------------------------------

"----------------------------------------------
" Colors
"----------------------------------------------
"set termguicolors
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum
"set t_Co=256                      " color mode in ssh

colorscheme triplejelly

"----------------------------------------------
"VisualStudioDark
"colorscheme VisualStudioDark
"hi Normal guibg=NONE ctermbg=NONE
"----------------------------------------------

"----------------------------------------------
"colorscheme solarized
"set background=dark
"let g:solarized_termcolors = 256
"let g:solarized_termtrans = 1
"----------------------------------------------


"----------------------------------------------
"colorscheme PaperColor
"set background=dark
" Override the search highlight color with a combination that is easier to
" read. The default PaperColor is dark green backgroun with black foreground.
"
" Reference:
" - http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"highlight Search guibg=DeepPink4 guifg=White ctermbg=53 ctermfg=White
"----------------------------------------------

" Toggle background with <leader>bg
map <leader>bg :let &background = (&background == "dark"? "light" : "dark")<cr>


"----------------------------------------------
" Indenting  http://vim.wikia.com/wiki/Fix_indentation
"----------------------------------------------

map <F12> mzgg=G`z

"----------------------------------------------
" Searching
"----------------------------------------------
set incsearch                     " move to match as you type the search query
set hlsearch                      " disable search result highlighting

if has('nvim')
    set inccommand=split          " enables interactive search and replace
endif

" Clear search highlights
map <leader>c :nohlsearch<cr>

" These mappings will make it so that going to the next one in a search will
" center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"----------------------------------------------
" Navigation
"----------------------------------------------
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

" Move between buffers with Shift + arrow key...
nnoremap <S-Left> :bprevious<cr>
nnoremap <S-Right> :bnext<cr>

" ... but skip the quickfix when navigating
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" Fix some common typos
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


"----------------------------------------------
" Edit
"----------------------------------------------
" Delete without copy (black hole register)
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP


"----------------------------------------------
" Plugin: killphi/vim-legend
"----------------------------------------------
let g:legend_active_auto = 1


"----------------------------------------------
" Auto Pair
"----------------------------------------------
" Gentle auto pair
let g:AutoPairsUseInsertedCount = 1

"----------------------------------------------
" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitbelow
set splitright

" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Closing splits
nnoremap <leader>q :close<cr>

"----------------------------------------------
" Plugin: MattesGroeger/vim-bookmarks
"----------------------------------------------
" Auto save bookmarks
let g:bookmark_auto_save = 1

" Store the bookmarks in the projects
let g:bookmark_save_per_working_dir = 1

" Disable the default key mappings
let g:bookmark_no_default_key_mappings = 1

" Configure key mappings
" This part also fixes conflicts with NERDTree
function! BookmarkMapKeys()
    nmap Mm :BookmarkToggle<cr>
    nmap Mi :BookmarkAnnotate<cr>
    nmap Mn :BookmarkNext<cr>
    nmap Mp :BookmarkPrev<cr>
    nmap Ma :BookmarkShowAll<cr>
    nmap Mc :BookmarkClear<cr>
    nmap Mx :BookmarkClearAll<cr>
    nmap Mkk :BookmarkMoveUp
    nmap Mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap Mm
    unmap Mi
    unmap Mn
    unmap Mp
    unmap Ma
    unmap Mc
    unmap Mx
    unmap Mkk
    unmap Mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()


" ----------------------------
" ---- AutoGroup Settings ----
" ----------------------------
augroup AutoGroup
    autocmd!
augroup END

command! -nargs=* Autocmd autocmd AutoGroup <args>
command! -nargs=* AutocmdFT autocmd AutoGroup FileType <args>

"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#auto_complete_delay = 0
    let g:deoplete#auto_complete_start_length = 1
    let g:deoplete#auto_completion_start_length = 1
    let g:deoplete#enable_camel_case = 1
    let g:deoplete#enable_ignore_case = 1
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#file#enable_buffer_path = 1
    let g:deoplete#max_list = 10000
endif

"----------------------------------------------
" Plugin: bling/vim-airline
"----------------------------------------------
" Show status bar by default.
set laststatus=2
set statusline+=%{fugitive#statusline()}

" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1

" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 1

" Explicitly define some symbols that did not work well for me in Linux.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.maxlinenr = ''

"----------------------------------------------
" Plugin: christoomey/vim-tmux-navigator
"----------------------------------------------
" tmux will send xterm-style keys when its xterm-keys option is on.
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Tmux vim integration
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1

" Move between splits with ctrl+h,j,k,l
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

" Move between buffers with right alt key...
nnoremap <A-h> :bprevious<cr>
nnoremap <A-l> :bnext<cr>

"----------------------------------------------
" Plugin: 'ctrlpvim/ctrlp.vim'
"----------------------------------------------
" Note: We are not using CtrlP much in this configuration. But vim-go depend on
" it to run GoDecls(Dir).

" Disable the CtrlP mapping, since we want to use FZF instead for <c-p>.
let g:ctrlp_map = ''

"----------------------------------------------
" Plugin: easymotion/vim-easymotion
"----------------------------------------------
" Enable support for bidirectional motions
map  <leader><leader>w <Plug>(easymotion-bd-w)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)

"----------------------------------------------
" Plugin: 'itchyny/calendar.vim'
"----------------------------------------------
" Enable Google Calendar integration.
let g:calendar_google_calendar = 1

" Enable Google Tasks integration.
let g:calendar_google_task = 1

" Other options
let g:calendar_first_day = "monday"           " Weeks starts with Monday
let g:calendar_date_endian = "big"            " Format: year / month / day
let g:calendar_date_separator = "-"           " Format: year - month - day
let g:calendar_week_number = 1                " Show week numbers
let g:calendar_view = "days"                  " Set days as the default view

"----------------------------------------------
" Plugin: 'junegunn/fzf.vim'
"----------------------------------------------
nnoremap <c-p> :FZF<cr>
nnoremap <c-w> :Windows<cr>
nnoremap <c-f> :Buffers<cr>
nnoremap <c-g> :Commits<cr>
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!vendor/*" --glob "!artifacts/*" --color "always" --type "go" '.shellescape(<q-args>), 0, <bang>0)

command! -bang -nargs=* FindAny call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!vendor/*" --glob "!artifacts/*" --color "always" '.shellescape(<q-args>), 0, <bang>0)
"----------------------------------------------
" Plugin: 'majutsushi/tagbar'
"----------------------------------------------
" Add shortcut for toggling the tag bar
nnoremap <F3> :TagbarToggle<cr>

" Language: Go
" Tagbar configuration for Golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"----------------------------------------------
" Plugin: plasticboy/vim-markdown
"----------------------------------------------
" Disable folding
let g:vim_markdown_folding_disabled = 1

" Auto shrink the TOC, so that it won't take up 50% of the screen
let g:vim_markdown_toc_autofit = 1

"----------------------------------------------
" Plugin: rbgrouleff/bclose.vim
"----------------------------------------------
" Close buffers
nnoremap <leader>w :Bclose<cr>

"----------------------------------------------
" Plugin: mileszs/ack.vim
"----------------------------------------------
" Open ack
nnoremap <leader>a :Ack!<space>
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif
cnoreabbrev ag Ack!
cnoreabbrev aG Ack!
cnoreabbrev Ag Ack!
cnoreabbrev AG Ack!

"----------------------------------------------
" Plugin: neomake/neomake
"----------------------------------------------
" Configure signs.
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <F2> :RangerNewTab<cr>

" add this line if you use NERDTree
let g:NERDTreeHijackNetrw = 0
" open ranger when vim open a directory
let g:ranger_replace_netrw = 1

" Files to ignore
let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^\.DS_Store$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
\]

" Close vim if NERDTree is the only opened window.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files by default.
let NERDTreeShowHidden = 1

" Allow NERDTree to change session root.
let g:NERDTreeChDirMode = 2

"----------------------------------------------
" Plugin: sebdah/vim-delve
"----------------------------------------------
" Set the Delve backend.
let g:delve_backend = "native"

"----------------------------------------------
" Plugin: Shougo/neosnippet
"----------------------------------------------
" Disable the default snippets (needed since we do not install
" Shougo/neosnippet-snippets).
"
" Below you can disable default snippets for specific languages. If you set the
" language to _ it sets the default for all languages.
let g:neosnippet#disable_runtime_snippets = {
    \ 'go': 1
\}

" Keybindings
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

au FileType json set conceallevel=0

" Set the path to our snippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

"----------------------------------------------
" Plugin: vimwiki/vimwiki
"----------------------------------------------
" Path to wiki
let g:vimwiki_list = [{
        \ 'path': '~/Dropbox/vimwiki',
        \ 'syntax': 'markdown',
        \ 'ext': '.vimwiki.markdown'}]

au FileType vimwiki set expandtab
au FileType vimwiki set shiftwidth=2
au FileType vimwiki set softtabstop=2
au FileType vimwiki set tabstop=2

"----------------------------------------------
" Plugin: 'terryma/vim-multiple-cursors'
"----------------------------------------------
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_skip_key='<C-b>'

"----------------------------------------------
" Plugin: zchee/deoplete-go
"----------------------------------------------
" Enable completing of go pointers
AutocmdFT go call deoplete#custom#source('go', 'matchers', ['matcher_full_fuzzy'])
AutocmdFT go call deoplete#custom#source('go', 'sorters', [])
AutocmdFT go let g:deoplete#sources#go#align_class = 1
AutocmdFT go let g:deoplete#sources#go#cgo = 1
AutocmdFT go let g:deoplete#sources#go#cgo#libclang_path= expand("/usr/lib/llvm-4.0/lib/libclang-4.0.so.1")
AutocmdFT go let g:deoplete#sources#go#cgo#sort_algo = 'alphabetical'
AutocmdFT go let g:deoplete#sources#go#gocode_binary = globpath($GOPATH,"/bin/gocode")
AutocmdFT go let g:deoplete#sources#go#json_directory = globpath($NVIM_HOME,"/plugged/deoplete-go/data/json/*/").expand("$GOOS")."_".expand("$GOARCH")
AutocmdFT go let g:deoplete#sources#go#package_dot = 1
AutocmdFT go let g:deoplete#sources#go#on_event = 1
AutocmdFT go let g:deoplete#sources#go#pointer = 1
AutocmdFT go let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
AutocmdFT go let g:deoplete#sources#go#use_cache = 1
"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Mappings
au FileType go nmap <F1> :GoInfo<cr>
au FileType go nmap <F4> :GoReferrers<cr>
au Filetype go nmap <F7> :GoImplements<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F10> :GoTest -short<cr>
au Filetype go nmap <F11> :GoDescribe<cr>
au FileType go nmap <F12> <Plug>(go-def)
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au Filetype go nmap <leader>gi :GoImports<cr>
au Filetype go nmap <leader>gr :GoReferrers<cr>
au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
au FileType go nmap <leader>gd <Plug>(go-def)
au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <leader>gdh <Plug>(go-def-split)
au FileType go nmap <leader>gD <Plug>(go-doc)
au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gor <Plug>(go-run)
au FileType go nmap <leader>gf :GoFmt<cr>
au FileType go nmap <leader>t :GoTestFunc<cr>
au FileType go nmap <leader>gl :GoMetaLinter<cr>


"inoremap <Leader>a <Esc>:Rg <C-R><C-W><CR>
"nnoremap <Leader>a :Rg <C-R><C-W><CR>


" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

au FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <leader>r <Plug>(go-run)

" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

" Set info to use guru vs gocode
let g:go_info_mode = "guru"

" Set neosnippet as snippet engine
let g:go_snippet_engine = "neosnippet"



" First update vim-go and syntastic to latest versions.
" Then install/update go tools using :GoInstallBinaries and :GoUpdateBinaries

" Set default go build tags... Update ad-hoc with :GoBuildTags <new list>
let g:go_build_tags = "smoke integration"

" Get Syntastic to use build tags...
let g:syntastic_go_go_test_args = '-tags="smoke integration"'
let g:syntastic_go_go_build_args = '-tags="smoke integration"'

" Set go guru scope to current Git repo root... Update ad-hoc with :GoGuruScope if needing to include code outside of repo root.
let root_import_path = system("ABS=$(git rev-parse --show-toplevel); echo \${ABS#$GOPATH/src/}")
let g:go_guru_scope = [root_import_path]

" Other settings I find useful for go/syntastic...
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['go', 'errcheck', 'golint', 'govet', ]
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"




" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

" Add the failing test name to the output of :GoTest
let g:go_test_prepend_name = 1

" gometalinter configuration
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_command = "--config /home/jc/go/src/github.com/opentable/sous/gometalinter.json"
let g:go_metalinter_deadline = "10s"

" Set whether the JSON tags should be snakecase or camelcase.
let g:go_addtags_transform = "snakecase"

" neomake configuration for Go.
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'errcheck',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }

"----------------------------------------------
" Language: apiblueprint
"----------------------------------------------
au FileType apiblueprint set expandtab
au FileType apiblueprint set shiftwidth=4
au FileType apiblueprint set softtabstop=4
au FileType apiblueprint set tabstop=4

"----------------------------------------------
" Language: Bash
"----------------------------------------------
au FileType sh set noexpandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2

"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: fish
"----------------------------------------------
au FileType fish set expandtab
au FileType fish set shiftwidth=2
au FileType fish set softtabstop=2
au FileType fish set tabstop=2

"----------------------------------------------
" Language: gitconfig
"----------------------------------------------
au FileType gitconfig set noexpandtab
au FileType gitconfig set shiftwidth=2
au FileType gitconfig set softtabstop=2
au FileType gitconfig set tabstop=2

"----------------------------------------------
" Language: HTML
"----------------------------------------------
au FileType html set expandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2


" mark Jenkinsfile as groovy filetype
au BufReadPost Jenkinsfile set syntax=groovy
au BufReadPost Jenkinsfile set expandtab
au BufReadPost Jenkinsfile set shiftwidth=2
au BufReadPost Jenkinsfile set softtabstop=2
au BufReadPost Jenkinsfile set tabstop=2

"----------------------------------------------
" Language: groovy
"----------------------------------------------
au FileType groovy set expandtab
au FileType groovy set shiftwidth=2
au FileType groovy set softtabstop=2
au FileType groovy set tabstop=2

"----------------------------------------------
" Language: LESS
"----------------------------------------------
au FileType less set expandtab
au FileType less set shiftwidth=2
au FileType less set softtabstop=2
au FileType less set tabstop=2

"----------------------------------------------
" Language: Make
"----------------------------------------------
au FileType make set noexpandtab
au FileType make set shiftwidth=2
au FileType make set softtabstop=2
au FileType make set tabstop=2

au BufReadPost Makefile set syntax=make
au BufReadPost Makefile set noexpandtab
au BufReadPost Makefile set shiftwidth=2
au BufReadPost Makefile set softtabstop=2
au BufReadPost Makefile set tabstop=2

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
au FileType markdown setlocal spell
au FileType markdown set expandtab
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4
au FileType markdown set syntax=markdown

"----------------------------------------------
" Language: PlantUML
"----------------------------------------------
au FileType plantuml set expandtab
au FileType plantuml set shiftwidth=2
au FileType plantuml set softtabstop=2
au FileType plantuml set tabstop=2

"----------------------------------------------
" Language: Protobuf
"----------------------------------------------
au FileType proto set expandtab
au FileType proto set shiftwidth=2
au FileType proto set softtabstop=2
au FileType proto set tabstop=2

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

"----------------------------------------------
" Language: Ruby
"----------------------------------------------
au FileType ruby set expandtab
au FileType ruby set shiftwidth=2
au FileType ruby set softtabstop=2
au FileType ruby set tabstop=2

" Enable neomake for linting.
"au FileType ruby autocmd BufWritePost * Neomake

"----------------------------------------------
" Language: SQL
"----------------------------------------------
au FileType sql set expandtab
au FileType sql set shiftwidth=2
au FileType sql set softtabstop=2
au FileType sql set tabstop=2

"----------------------------------------------
" Language: Thrift
"----------------------------------------------
au FileType thrift set expandtab
au FileType thrift set shiftwidth=2
au FileType thrift set softtabstop=2
au FileType thrift set tabstop=2

"----------------------------------------------
" Language: TOML
"----------------------------------------------
au FileType toml set expandtab
au FileType toml set shiftwidth=2
au FileType toml set softtabstop=2
au FileType toml set tabstop=2

"----------------------------------------------
" Language: TypeScript
"----------------------------------------------
au FileType typescript set expandtab
au FileType typescript set shiftwidth=4
au FileType typescript set softtabstop=4
au FileType typescript set tabstop=4

"----------------------------------------------
" Language: Vader
"----------------------------------------------
au FileType vader set expandtab
au FileType vader set shiftwidth=2
au FileType vader set softtabstop=2
au FileType vader set tabstop=2

"----------------------------------------------
" Language: vimscript
"----------------------------------------------
au FileType vim set expandtab
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2


" BufOnly.vim  -  Delete all the buffers except the current/named buffer.
"
" Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Bonly / :BOnly / :Bufonly / :BufOnly [buffer]
"
" Without any arguments the current buffer is kept.  With an argument the
" buffer name/number supplied is kept.

command! -nargs=? -complete=buffer -bang Bonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
	if a:buffer == ''
		" No buffer provided, use the current buffer.
		let buffer = bufnr('%')
	elseif (a:buffer + 0) > 0
		" A buffer number was provided.
		let buffer = bufnr(a:buffer + 0)
	else
		" A buffer name was provided.
		let buffer = bufnr(a:buffer)
	endif

	if buffer == -1
		echohl ErrorMsg
		echomsg "No matching buffer for" a:buffer
		echohl None
		return
	endif

	let last_buffer = bufnr('$')

	let delete_count = 0
	let n = 1
	while n <= last_buffer
		if n != buffer && buflisted(n)
			if a:bang == '' && getbufvar(n, '&modified')
				echohl ErrorMsg
				echomsg 'No write since last change for buffer'
							\ n '(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . n
				if ! buflisted(n)
					let delete_count = delete_count+1
				endif
			endif
		endif
		let n = n+1
	endwhile

	if delete_count == 1
		echomsg delete_count "buffer deleted"
	elseif delete_count > 1
		echomsg delete_count "buffers deleted"
	endif

endfunction

nnoremap <c-q> :Bonly<cr>

