local M = {}

M.setup = function()
    -- Copilot config

    -- Disable mapping <Tab> to accept the suggestion
    vim.g.copilot_no_tab_map = true

    -- Remap <Right> to accept Copilot suggestions
    vim.api.nvim_set_keymap(
        'i',                         -- Mode: Insert mode
       '<C-l>',                   -- Key: Right arrow key
       'copilot#Accept("<C-l>")',    -- Command: Accept Copilot suggestion with Enter
        {
           expr   = true,           -- Evaluate RHS as an expression
           silent = true,           -- Do not print the mapping to the command line
        }
    )
end

return M
