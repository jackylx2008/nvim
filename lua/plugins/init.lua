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
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

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
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	-- use 'hrsh7th/cmp-vsnip'
	-- use 'hrsh7th/vim-vsnip'

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Telescope
	use({ -- Telescope! The fast and efficient way to find the file, context, git etc.
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- Better colorized the code
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")

	--format
	use("lukas-reineke/format.nvim")
	use({
		"sbdchd/neoformat",
	})

	use({ -- Bottem status line
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ -- Top buffers line
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use({ -- File explorer
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup()
		end,
	})
	use("windwp/nvim-ts-autotag") -- Automatic insert the tag, like <html></html>
	use("p00f/nvim-ts-rainbow") -- Colorized brackets etc.
	use("windwp/nvim-autopairs") -- Automatic finish the brackets etc.
	use({ -- Keymappings and show the index
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	})
	use({ -- Smooth scroll the text
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
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	-- 退格引线
	use("   lukas-reineke/indent-blankline.nvim")
	-- Speed up loading Lua modules in Neovim to improve startup time.
	use("lewis6991/impatient.nvim")
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
end)
