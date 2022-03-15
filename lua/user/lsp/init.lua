local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end
require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("lspconfig").clangd.setup({})
-- require("user.lsp.null-ls")  BUG: 不知道为什么用with传的参数都不起作用，只能用默认设置进行lua和cpp的格式化
-- TODO: 用format.nvim 解决目前的问题，不过这个插件已经没有人维护，期待null-ls完善吧
require("user.lsp.format")
