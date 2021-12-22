set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent smartindent
filetype plugin on

let mapleader = " "

call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug '907th/vim-auto-save'
Plug 'https://github.com/tpope/vim-surround'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'SirVer/ultisnips'
Plug 'bkad/CamelCaseMotion'
Plug 'mattn/emmet-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'easymotion/vim-easymotion'
Plug 'andymass/vim-matchup'

"#######LSP
Plug 'neovim/nvim-lspconfig' "lua vim.lsp.stop_client(vim.lsp.get_active_clients()) you need to run for new tsconfig.json
" Plug 'glepnir/lspsaga.nvim'
Plug 'tami5/lspsaga.nvim'
Plug 'creativenull/diagnosticls-configs-nvim'
"for easier efm-server configuration:
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

"tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


call plug#end()

"move through errors/warnings
nnoremap <silent><C-k> :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent><C-j> :Lspsaga diagnostic_jump_next<CR>
"Diagnostics
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
"preview definition
nnoremap <silent><leader>gd :Lspsaga preview_definition<CR>
"Async LSP Finder
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
" show hover doc
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

"auto-pair
" let g:AutoPairsShortcutFastWrap = 1
"very cool: ()|hello ---Alt + e ---> (hello)
"very cool: (|)[hello] ---Alt + ] ---> ([hello])

"matchup
let g:matchup_surround_enabled = 1
augroup matchup_matchparen_highlight
  autocmd!
  autocmd ColorScheme * hi MatchParen cterm=underline gui=underline guisp=red
  " autocmd ColorScheme * hi MatchParen  guisp=#282a36
  autocmd ColorScheme * hi MatchParenCur cterm=underline gui=underline guisp=red
  " autocmd ColorScheme * hi MatchWord cterm=underline gui=underline guisp=red
  " autocmd ColorScheme * hi MatchWordCur guifg=red cterm=underline gui=underline guisp=#282a36
augroup END
let g:matchup_matchparen_offscreen = {'mehod': 'popup'}

"Emmet-vim
let g:user_emmet_leader_key=','

"CamelCaseMotion
let g:camelcasemotion_key = '<leader>'
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

"ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"               
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
nmap <Leader>es :e ~/.config/nvim/UltiSnips<cr>

"prettier
nnoremap <leader>1 :!prettier -w % <cr><cr> :e <cr>
"lsp prettier
" nnoremap <leader>1 :lua vim.lsp.buf.formatting_seq_sync()<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" you need to install rg: sudo snap install ripgrep --classic
nnoremap <leader>fg <cmd>Telescope live_grep<cr> 
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]

"hello <em>world</em> 
set termguicolors     " enable true colors support
colorscheme dracula


nnoremap <leader>pv :Vex<CR>
nnoremap - :Ex<CR>
inoremap ii <esc>

"fzf - fuzzyfinder"
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>

" Our remaps
inoremap ii <esc>
nnoremap Y y$ 

" keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap J mzJ'z

"upper/lower case
nnoremap <leader>u vgU
nnoremap <leader>l vgu

"undo break points
inoremap , ,<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap . .<c-g>u

" nnoremap <C-j> :cnext<CR>
" nnoremap <C-k> :cprev<CR>

"highlight and yank, then you can paste it a higlighted area
vnoremap <leader>f "_dP 

"copies to clipboard
vnoremap <leader>y "+y 
nnoremap <leader>y "+y

"Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <c-j> <esc>:m +1<CR>==i
inoremap <c-k> <esc>:m -2<CR>==i
nnoremap <leader>j :m +1<CR>==
nnoremap <leader>k :m -2<CR>==

"insert line and leave insert mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

"highlight until end of line
vnoremap $ $h

"end of file center
nnoremap G Gzz

"run node on current file
nnoremap <leader>n :!node %<CR>
"run python on current file
nnoremap <leader>p :!python3 %<CR>

"toggle line number
nnoremap <leader>r :set relativenumber!<cr>

"add console.log
" nmap <Leader>cl _v$S)_iconsole.log

"Edit init.vim easy"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

"open tab
nmap <Leader>t :tabedit %<cr>

"close all split files except the one currently focused
nnoremap <Leader>o : only<cr>

"Add simple highlight removal.
nmap <Leader><space><space> :nohlsearch<cr>

"Disable auto comment on new line
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
"--------Auto-Commands-----"
"Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!     
	autocmd BufWritePost init.vim source %
augroup END

"Set up persistent undo across all files.
set undofile
if !isdirectory(expand("$HOME/.config/nvim/undodir"))
  call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.config/nvim/undodir

    
command! Scratch lua require'tools'.makeScratch() 
nnoremap <Leader>c :Scratch<cr>

lua require 'lsp'
lua require 'version'

