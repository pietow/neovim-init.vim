boolean = vim.api.nvim_eval('has("nvim-0.7.0")') 

if (boolean == 1)
    then
        print('Neovim nightly')
    else
        print('Neovim stable')
    end
