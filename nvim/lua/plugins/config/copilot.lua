local M = {}

M.setup = function()
    -- Copilot config

    -- Disable mapping <Tab> to accept the suggestion.
    vim.g.copilot_no_tab_map = true

    vim.api.nvim_set_keymap(
        'i',                         -- Mode
       '<C-l>',                      -- Key
       'copilot#Accept("<C-l>")',    -- Command: Accept Copilot suggestions with
        {
           expr   = true,            -- Evaluate RHS as an expression
           silent = true,            -- Do not print the mapping to the command line
        }
    )
end

return M
