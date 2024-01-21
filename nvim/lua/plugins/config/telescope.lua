local M = {}

M.setup = function()
    -- Telescope config

    require('telescope').setup {
        defaults = {
            -- Layout
            layout_config = {
                prompt_position = 'top',
            },
            -- Sorting
            sorting_strategy = 'ascending',
            -- Preview
            file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
            grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
            qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
            -- Mappings
            mappings = {
                i = {
                    ['<C-j>'] = require('telescope.actions').move_selection_next,
                    ['<C-k>'] = require('telescope.actions').move_selection_previous,
                    ['<C-q>'] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
                },
            },
        },
        extensions = {
            -- FZF
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = false, -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = 'smart_case',        -- or "ignore_case" or "respect_case", the default case_mode is "smart_case"
            },
        },
    }
end

return M
