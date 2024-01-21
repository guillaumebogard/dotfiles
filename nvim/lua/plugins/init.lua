-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none', -- no history
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- LSP
    {
        'neovim/nvim-lspconfig', -- LSP Configuration & Plugins
        dependencies = {
            {
                'williamboman/mason.nvim', -- Automatically install LSPs to stdpath for neovim
                config = true
            },
            'williamboman/mason-lspconfig.nvim',
            {
                'j-hui/fidget.nvim', -- Useful status updates for LSP
                opts = {}            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            },
            'folke/neodev.nvim', -- Additional lua configuration, makes nvim stuff amazing!
        },
  },
    -- Github Copilot
    {
        'github/copilot.vim',
        config = function()
            require('plugins/config/copilot').setup()
        end,
    },
    -- Nvim Tree
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        config = function()
            require('plugins/config/nvim-tree').setup()
        end,
    },
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
              'nvim-telescope/telescope-fzf-native.nvim',
              build = 'make',
              cond = function()
                return vim.fn.executable 'make' == 1
              end,
            },
        },
        config = function()
            require('plugins/config/telescope').setup()
        end,
    },
})
