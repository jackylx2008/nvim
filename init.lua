require("user.settings")
require("user.keymappings")
require("user.plugins")
require("user.colorscheme")
require("user.conf")
require("user.lsp")

-- Disable visual text from LSP 就是禁用每行后面语法检查的提示，要不敲代码的时候后面一直有这个提示，比较烦人
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = false
    }
)

vim.g.ZFVimIM_openapi_enable = 1
vim.g.ZFVimIM_pinyin_gitUserEmail = "jackylx2008@hotmail.com"
vim.g.ZFVimIM_pinyin_gitUserName = "jackylx2008"
