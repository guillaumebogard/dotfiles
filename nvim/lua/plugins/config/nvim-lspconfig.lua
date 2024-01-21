-- Nvim LSP config

require('mason').setup()           -- Setup mason
require('mason-lspconfig').setup() -- Setup mason-lspconfig
require('neodev').setup()          -- Setup neovim lua configuration

local servers = {
    clangd = {},        -- C/C++
    hls = {},           -- Haskell
    rust_analyzer = {}, -- Rust
    lua_ls = {          -- Lua
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

local mason_lspconfig = require('mason-lspconfig') -- Ensure the servers above are installed

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end,
}
