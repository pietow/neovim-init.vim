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
" Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" Plug 'honza/vim-snippets'
Plug 'bkad/CamelCaseMotion'
Plug 'mattn/emmet-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'easymotion/vim-easymotion'
Plug 'andymass/vim-matchup'
" Plug 'Galooshi/vim-import-js'

"#######LSP
Plug 'neovim/nvim-lspconfig' "lua vim.lsp.stop_client(vim.lsp.get_active_clients()) you need to run for new tsconfig.json
Plug 'glepnir/lspsaga.nvim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"LSP Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" LSP Autocompletion suggetsions ultisnips users.
Plug 'quangnguyen30192/cmp-nvim-ultisnips'



" let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
call plug#end()


"async lsp finder
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>


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

"Makros
let @a= "%di)"
let @q = "GIresult = iiOre�kb�kb�kb�kb�kb�kblet res;"
let @w = "oconsole.log(resultiij"

"jest
" Run jest for current project
" command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" " Run jest for current file
" command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" " Run jest for current test
" nnoremap <leader>e :Jest<cr>

" " Init jest in current cwd, require global jest command exists
" command! JestInit :call CocAction('runCommand', 'jest.init')


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
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
" nnoremap <leader>1 :Prettier<cr>
nnoremap <leader>1 :!prettier -w % <cr><cr> :e <cr>
" nnoremap <leader>1 :!js-beautify -r -X % & prettier -w % <cr><cr>
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
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
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
nnoremap <Leader>c :Scratch<cr>

lua << EOF
require 'lspconfig'.tsserver.setup{}
EOF

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
       { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
EOF
