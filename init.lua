require("user.settings")
require("user.keymappings")
require("user.plugins")
require("user.colorscheme")

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
require("user.hop_conf")

-- Disable visual text from LSP 就是禁用每行后面语法检查的提示，要不敲代码的时候后面一直有这个提示，比较烦人
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
})

vim.g.ZFVimIM_openapi_enable = 1
vim.g.ZFVimIM_pinyin_gitUserEmail = "jackylx2008@hotmail.com"
vim.g.ZFVimIM_pinyin_gitUserName = "jackylx2008"

