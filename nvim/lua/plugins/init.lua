-- Plugins

-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',                        -- no history
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',                           -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used).
vim.g.mapleader          = ' '
vim.g.maplocalleader     = ' '

-- Disable netrw (default tree by Vim/Neovim) for nvim-tree.
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require('lazy').setup({

    -- Alpha-nvim
    -- Programmable greeter.
    {
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function ()
            require('plugins/config/alpha-nvim')
        end
    },

    -- Nvim Tree
    -- File explorer tree.
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('plugins/config/nvim-tree')
        end,
    },

    -- Tokyonight
    -- Color scheme.
    {
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd [[colorscheme tokyonight-night]]
        end,
    },

    -- Lua line
    -- Status line.
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('plugins/config/lualine')
        end,
    },

    -- Barbecue
    -- File & cursor status line.
    {
        "utilyre/barbecue.nvim",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },


    -- Nvim LSP Config
    -- LSP Configuration & Plugins.
    {
        'neovim/nvim-lspconfig',                 -- LSP Configuration & Plugins
        dependencies = {
            {
                'williamboman/mason.nvim',       -- Automatically install LSPs to stdpath
                config = true
            },
            'williamboman/mason-lspconfig.nvim', -- Automatically configure LSPs
            {
                'j-hui/fidget.nvim',             -- Useful status updates for LSP
                opts = {}                        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            },
            'folke/neodev.nvim',                 -- Additional lua configuration
        },
        config = function()
            require('plugins/config/nvim-lspconfig')
        end,
    },

    -- Nvim Treesitter
    -- Syntax highlighting.
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('plugins/config/nvim-treesitter')
        end,
    },

    -- Which Key
    -- Shows keybindings in popup.
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {},
    },

    -- Mapx
    -- Map keys with ease.
    {
        'b0o/mapx.nvim',
    },

    -- Comment
    -- Comment lines with `gc`.
    {
        'numToStr/Comment.nvim',
    },


    -- Telescope
    -- Highly extendable fuzzy finder.
    --
    -- Optional Dependencies:
    --  - `fd` (For file search)
    --  - `ripgrep` (For grep functionality)
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
            require('plugins/config/telescope')
        end,
    },

    -- Github Copilot
    -- Integrates GitHub Copilot.
    {
        'github/copilot.vim',
    },
})
