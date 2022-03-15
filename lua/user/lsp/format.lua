require("format").setup({
    ["*"] = {
        { cmd = { "sed -i 's/[ \t]*$//'" } }, -- remove trailing whitespace
    },
    vim = {
        {
            cmd = { "luafmt -w replace" },
            start_pattern = "^lua << EOF$",
            end_pattern = "^EOF$",
        },
    },
    vimwiki = {
        {
            cmd = { "prettier -w --parser babel" },
            start_pattern = "^{{{javascript$",
            end_pattern = "^}}}$",
        },
    },
    lua = {
        {
            --[[ cmd = {
				function(file)
					return string.format("luafmt -l %s -w replace %s", vim.bo.textwidth, file)
				end,
			}, ]]
            cmd = { "stylua --indent-type Spaces --indent-width 4" },
        },
    },
    cpp = {
        {
            cmd = { "clang-format -style=file -i" },
        },
    },
    c = {
        {
            cmd = { "clang-format -style=file -i" },
        },
    },
    javascript = {
        { cmd = { "prettier -w", "./node_modules/.bin/eslint --fix" } },
    },
    python = {
        { cmd = { "autopep8 -i" } },
    },
    --[[ markdown = {
        { cmd = { "prettier -w" } },
        {
            cmd = { "black" },
            start_pattern = "^```python$",
            end_pattern = "^```$",
            target = "current",
        },
    }, ]]
})
vim.cmd([[
    autocmd BufWritePost * FormatWrite
]])
