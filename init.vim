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

"######Fuzzy Finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"######Icons for telescope
Plug 'kyazdani42/nvim-web-devicons'

Plug 'SirVer/ultisnips'
Plug 'bkad/CamelCaseMotion'
Plug 'mattn/emmet-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'easymotion/vim-easymotion'
Plug 'andymass/vim-matchup'

"#######LSP
Plug 'neovim/nvim-lspconfig' "lua vim.lsp.stop_client(vim.lsp.get_active_clients()) you need to run for new tsconfig.json
Plug 'tami5/lspsaga.nvim'

"####Autocompletion
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
call plug#end()


