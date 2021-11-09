set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

let mapleader = " "

call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'honza/vim-snippets'
Plug 'bkad/CamelCaseMotion'
Plug 'mattn/emmet-vim'

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
call plug#end()

"Emmet-vim
let g:user_emmet_leader_key=','

"Makros
let @a= "%di)"
let @q = "GIresult = iiOre�kb�kb�kb�kb�kb�kblet res;"
let @w = "oconsole.log(resultiij"

"jest
" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>e :Jest<cr>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')


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
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
nnoremap <leader>1 :Prettier<cr>
" nmap <leader>1 :call CocAction('runCommand', 'prettier.formatFile')<cr>

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
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
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

"undo break points
inoremap , ,<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap . .<c-g>u

nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

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
nmap <Leader>cl _v$S)_iconsole.log

"Edit init.vim easy"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

"open tab
nmap <Leader>t :tabedit %<cr>

"close all split files except the one currently focused
nnoremap <Leader>o : only<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"removing annoying pseudo quotes
nnoremap <leader>q :silent! call ReplaceQuotes()<CR>
   fun! ReplaceQuotes()
       execute ":%s/“/\'/g"
       execute ":%s/”/\'/g"
       execute ":%s/‘/\'/g"
       execute ":%s/’/\'/g"
‘George’’, ‘is’, ‘‘hungry’
   endfun
" nnoremap<leader><leader> :%s/“\|”/"/g

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

"Lua
" lua << EOF
" print('hello from lua 2')
" print(vim.api.nvim_win_get_cursor(0))
" EOF
" lua require('basic')
" lua require('usermod.settings')
command! Scratch lua require'tools'.makeScratch() 
nmap <Leader>w :Scratch<cr>

