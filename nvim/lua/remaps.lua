-- Remaps for keybindings

local m = require('mapx').setup({
    global   = 'force',
    whichkey = true,
})

m.nname   ("<leader>l" , "LSP")
m.nnoremap("<leader>li", ":LspInfo<Cr>",               "LSP: [I]nformation"             )
m.nnoremap("<leader>lr", ":LspRestart<Cr>",            "LSP: [R]estart"                 )
m.nnoremap("<leader>ls", ":LspStart<Cr>",              "LSP: [S]tart"                   )
m.nnoremap("<leader>lS", ":LspStop<Cr>",               "LSP: [S]top"                    )

m.nname   ("<leader>f" , "Telescope")
m.nnoremap("<leader>ff", ":Telescope find_files<Cr>",  "Telescope: [F]ind [F]iles"      )
m.nnoremap("<leader>fg", ":Telescope live_grep<Cr>",   "Telescope: [F]ind [G]rep"       )
m.nnoremap("<leader>fd", ":Telescope diagnostics<Cr>", "Telescope: [F]ind [D]iagnostics")
