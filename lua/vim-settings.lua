vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

-- enable mouse, maybe for resizing splits
--vim.o.mouse = "a"

-- lualine plugin already shows mode, 
vim.o.showmode = false

-- try to sync OS clipboard with nvim's
-- schedule because it can take a long time
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- save undo historyr after closing file
vim.o.undofile = true

-- case insensitive search unless \C or capital letters in search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- sign column always on for consistency
vim.o.signcolumn = "yes"

-- new splits appear right or below
vim.o.splitright = true
vim.o.splitbelow = true

-- highlight cursor line
vim.o.cursorline = true

-- min number of likes to display above/below cursor
vim.o.scrolloff = 10

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
