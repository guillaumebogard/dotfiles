-- Setting options

-- See `:help vim.o`

-- Identation, tabs, and spaces
vim.opt.tabstop       = 4    -- Sets the number of spaces that a tab character represents.
vim.opt.softtabstop   = 0    -- Makes Neovim treat a combination of spaces and tabs like tab stops at a width of tabstop. Zero means it uses the value of tabstop.
vim.opt.shiftwidth    = 4    -- Defines the number of spaces to use for each step of (auto)indent, set to 4 spaces here.
vim.opt.expandtab     = true -- Converts tabs to spaces, providing consistent indentation regardless of the editor/viewer.

-- Search
vim.opt.hlsearch      = false -- All search occurrences are highlighted.
vim.opt.incsearch     = true  -- Incremental search; shows partial matches for a pattern as you type.
vim.opt.ignorecase    = true  -- Makes all searches case-insensitive. Searching for 'example', 'Example', 'EXAMPLE', etc., will yield the same results.
vim.opt.smartcase     = true  -- Overrides `ignorecase` if the search pattern contains uppercase letters. If you search for 'Example', it will be case-sensitive, but 'example' will be case-insensitive.

-- Display
vim.wo.number         = true    -- Enables absolute line numbering. Shows the actual line number for each line in the file.
vim.wo.relativenumber = false   -- Displays line numbers relative to the current line. The line you're on is numbered 0, and the lines above and below are numbered relative to this line (e.g., 1, 2, 3, ...).
vim.o.scrolloff       = 7       -- The minimum number of lines to keep above and below the cursor when scrolling.

-- Mouse
vim.o.mousemodel      = 'popup' -- Enables mouse support in all modes. The 'popup' option allows the mouse to be used in a terminal window.
vim.o.mouse           = 'n'     -- Enables mouse support in specific modes. 'n' is normal mode, 'v' is visual mode, 'i' is insert mode, 'c' is command-line mode, and 'a' is all modes.

-- History
vim.opt.undofile      = true -- Enables persistent undo, which allows you to undo changes after closing and reopening a file.

-- Commands
vim.o.shell           = '/bin/bash' -- Sets the shell to use for `:!` commands.

-- Terminal
vim.opt.termguicolors = true -- Allows Neovim to use 24-bit RGB colors, providing a much wider color range.

-- Determines how Neovim interacts with the system clipboard.
-- 'unnamedplus' uses the system's clipboard for copy and paste operations.
vim.opt.clipboard     = 'unnamedplus'

-- Patterns for files and directories that should be ignored during file navigation and completion activities.
vim.opt.wildignore:append {
    '*.swp',    -- Vim swap
    '*.o',      -- Object
    '*.a',      -- Static library
    '*.so',     -- Shared object
    '*.exe',    -- Windows executable
    '*.dll',    -- Windows dynamic library
    '*/tmp/*',  -- Temporary files
    '*.pyc',    -- Python compiled
    '*.zip',    -- Zip
    '*.db',     -- Database
    '*.sqlite', -- SQLite database
    '*.pdf',    -- PDF
    '*.png',    -- PNG
    '*.jpg',    -- JPG
    '*.jpeg',   -- JPEG
    '*.gif',    -- GIF
    '*.obj',    -- 3D object
    '*.class',  -- Java class
    '*.jar'     -- Java archive
}
