local nvim_lsp = require('lspconfig')
local coq = require "coq"

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --...
  --NVIM-LSP-TS-UTILS
  -- local ts_utils = require("nvim-lsp-ts-utils")

  -- -- defaults
  -- ts_utils.setup({
  --     debug = false,
  --     disable_commands = false,
  --     enable_import_on_completion = false,

  --     -- import all
  --     import_all_timeout = 5000, -- ms
  --     -- lower numbers = higher priority
  --     import_all_priorities = {
  --         same_file = 1, -- add to existing import statement
  --         local_files = 2, -- git files or files with relative path markers
  --         buffer_content = 3, -- loaded buffer content
  --         buffers = 4, -- loaded buffer names
  --     },
  --     import_all_scan_buffers = 100,
  --     import_all_select_source = false,

  --     -- filter diagnostics
  --     filter_out_diagnostics_by_severity = {},
  --     filter_out_diagnostics_by_code = {},

  --     -- inlay hints
  --     auto_inlay_hints = true,
  --     inlay_hints_highlight = "Comment",

  --     -- update imports on file move
  --     update_imports_on_move = false,
  --     require_confirmation_on_move = false,
  --     watch_dir = nil,
  -- })

  -- -- required to fix code action ranges and filter diagnostics
  -- ts_utils.setup_client(client)

  -- -- no default maps, so you may want to define some here
  -- local opts = { silent = true }
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
end

-- TypeScript
nvim_lsp.tsserver.setup(coq.lsp_ensure_capabilities({on_attach=on_attach}))

local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '⚠️',
  warn_sign = 'W',
  hint_sign = 'H',
  infor_sign = '⚠️',
  border_style = "round",
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  max_preview_lines = 50, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
      open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
  },
  code_action_keys = {
      quit = 'q',exec = '<CR>'
  },
}

--eslint and prettier
nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 10,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      -- prettier = {
      --   command = 'prettier',
      --   args = { '--stdin-filepath', '%filename' }
      -- }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'eslint_d',
      javascriptreact = 'eslint_d',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'eslint_d',
      typescriptreact = 'eslint_d',
      json = 'prettier',
      markdown = 'prettier',
    }
  }
}

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = {
        severity_limit='all'
    },
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
        spacing = 6,
        update_in_insert = false,
        prefix = ' '
    }
}
)
