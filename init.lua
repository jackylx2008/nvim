-- local keymap = vim.api.nvim_set_keymap
-- local opts = { noremap = true, silent = true }
require("user.settings")
require("user.keymappings")
-- ~/.config/nvim/lua/plugins/init.lua
require("plugins")

-- vim.cmd[[colorscheme onedark]]
-- vim.cmd[[colorscheme nord]]
-- vim.cmd([[colorscheme doom-one]])
vim.g.vscode_style = "dark"
-- vim.cmd([[colorscheme vscode]])
require("user.catppuccin_theme")
-- vim.cmd([[colorscheme tokyonight]])
vim.cmd([[colorscheme catppuccin]])

require("user.which-key")
require("user.todo_comments")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim_tree")
require("user.bufferline")
require("user.lualine")

require("user.indent-blankline")
require("user.impatient")
require("user.alpha")

-- Disable visual text from LSP 就是禁用每行后面语法检查的提示，要不敲代码的时候后面一直有这个提示，比较烦人
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
})
-- vim.g.smartim_default = "com.apple.keylayout.ABC"
vim.g.ZFVimIM_openapi_enable = 1
vim.g.ZFVimIM_pinyin_gitUserEmail = "jackylx2008@hotmail.com"
vim.g.ZFVimIM_pinyin_gitUserName = "jackylx2008"
vim.g.ZFVimIM_pinyin_gitUserToken = "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"
