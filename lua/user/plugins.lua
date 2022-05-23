---@diagnostic disable: undefined-global
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--     augroup packer_user_config
--         autocmd!
--         autocmd BufWritePost plugins.lua source <afile> | PackerSync
--     augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end
-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim") -- Packer itself
	use("lewis6991/impatient.nvim") -- Speed up loading Lua modules in Neovim to improve startup time.
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("rcarriga/nvim-notify") -- notify
	use("kyazdani42/nvim-web-devicons") -- icons

	use("shaunsingh/nord.nvim") -- Colorscheme
	use("sainnhe/gruvbox-material") -- Colorscheme
	use("navarasu/onedark.nvim") -- Colorscheme
	use("folke/tokyonight.nvim") -- Colorscheme
	use("NTBBloodbath/doom-one.nvim")
	-- use({
	--     "catppuccin/nvim",
	--     as = "catppuccin"
	-- })
	--   use({  -- Colorscheme
	--   'NTBBloodbath/doom-one.nvim',
	--   config = function()
	--     require('doom-one').setup({
	--       terminal_colors = false,
	--       cursor_coloring = false,
	--       italic_comments = false,
	--       enable_treesitter = true,
	--       transparent_background = false,
	--       pumblend = {
	--         enable = true,
	--         transparency_amount = 20,
	--       },
	--       plugins_integrations = {
	--         neorg = true,
	--         barbar = true,
	--         bufferline = true,
	--         gitgutter = false,
	--         gitsigns = true,
	--         telescope = true,
	--         neogit = true,
	--         nvim_tree = false,
	--         dashboard = true,
	--         startify = true,
	--         whichkey = true,
	--         indent_blankline = false,
	--         vim_illuminate = true,
	--         lspsaga = false,
	--       },
	--     })
	--   end,
	-- })
	use("Mofiqul/vscode.nvim") -- Colorscheme

	-- 自动补全 cmp plugins
	use("neovim/nvim-lspconfig") -- enable LSP
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/nvim-cmp") -- The completion plugin

	use("hrsh7th/cmp-nvim-lua")
	-- use 'hrsh7th/cmp-vsnip'
	-- use 'hrsh7th/vim-vsnip'
	-- use "quangnguyen30192/cmp-nvim-tags"
	use("jsfaint/gen_tags.vim")
	use("ray-x/cmp-treesitter")
	use("f3fora/cmp-spell") -- spell check
	-- use "github/copilot.vim"  -- Copilot setup,
	-- use {
	--   "tzachar/cmp-tabnine", -- use ":CmpTabnineHub" command to login
	--   after = "nvim-cmp",
	--   run = 'bash ./install.sh',
	-- }

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})
	-- use {
	--   "nvim-telescope/telescope-frecency.nvim",
	--   requires = {"tami5/sqlite.lua"}   -- NOTE: need to install sqlite lib
	-- }
	use("nvim-telescope/telescope-ui-select.nvim") -- TODO:有何功能未知
	use("nvim-telescope/telescope-live-grep-raw.nvim")
	use("MattesGroeger/vim-bookmarks")
	use("tom-anders/telescope-vim-bookmarks.nvim")
	use("nvim-telescope/telescope-dap.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Better colorized the code
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("nvim-treesitter/nvim-treesitter-textobjects") -- TODO:不知道具体有什么功能

	-- Git
	use("lewis6991/gitsigns.nvim")

	--format
	use("lukas-reineke/format.nvim")
	use("sbdchd/neoformat")
	-- Bottem status line
	use("nvim-lualine/lualine.nvim")
	use("SmiteshP/nvim-gps")
	-- Top buffers line
	use("akinsho/bufferline.nvim")
	-- File explorer
	use("kyazdani42/nvim-tree.lua")
	use("windwp/nvim-ts-autotag") -- Automatic insert the tag, like <html></html>
	use("p00f/nvim-ts-rainbow") -- Colorized brackets etc.
	use("windwp/nvim-autopairs") -- Automatic finish the brackets etc.
	use({
		-- Keymappings and show the index
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	})
	use({
		-- Smooth scroll the text
		"karb94/neoscroll.nvim",
		-- opt = true,
		config = function()
			require("neoscroll").setup()
		end,

		-- lazy loading
		-- setup = function()
		--   require("core.utils").packer_lazy_load "neoscroll.nvim"
		-- end,
	})
	-- 快速分析启动时间
	use("dstein64/vim-startuptime")
	-- 历史修改记录
	use("mbbill/undotree")
	-- 增删改引号
	use("tpope/vim-surround")
	-- 代码高亮
	use("itchyny/vim-cursorword")
	use("lfv89/vim-interestingwords")
	-- 代码注释
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	-- 退格引线
	use("lukas-reineke/indent-blankline.nvim")
	-- Dashboard
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim")
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" })
	-- 中文输入法
	use("ZSaberLv0/ZFVimIM")
	use("ZSaberLv0/ZFVimJob")
	use("jackylx2008/ZFVimIM_pinyin_base")
	use("ZSaberLv0/ZFVimIM_openapi")
	-- EasyMotion
	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		-- config = function()
		--   -- you can configure Hop the way you like here; see :h hop-config
		--   require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		-- end
	})
	-- AutoSave
	use("Pocco81/AutoSave.nvim")
	--AutoRead
	-- use("djoshea/vim-autoread")
	-- SnippetRun
	use({ "michaelb/sniprun", run = "bash ./install.sh" })
end)
