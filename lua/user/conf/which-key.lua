local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local which_key_settings = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in normal or <c-r> in insert mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ...
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" },
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	-- ["b"] = {
	--     "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	--     "Buffers",
	-- },
	["e"] = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Exit" },
	["c"] = { "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", "Close Buffer" },
	["f"] = {
		-- "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"<cmd>Telescope find_files<CR>",
		"Telescope Find File",
	},
	["F"] = { "<cmd>Telescope live_grep <CR>", "Find Text" },
	-- ["P"] = { "<cmd>Telescope projects<cr>", "Projects" },
	["u"] = { "<cmd>UndotreeToggle<CR>", "Undotree" },

	b = {
		name = "Buffers",
		j = { "<cmd>BufferPick<cr>", "Jump" },
		f = { "<cmd>Telescope buffers<cr>", "Find" },
		b = { "<cmd>b#<cr>", "Previous" },
		w = { "<cmd>BufferWipeout<cr>", "Wipeout" },
		e = {
			"<cmd>BufferCloseAllButCurrent<cr>",
			"Close all but current",
		},
		h = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left" },
		l = {
			"<cmd>BufferCloseBuffersRight<cr>",
			"Close all to the right",
		},
		D = {
			"<cmd>BufferOrderByDirectory<cr>",
			"Sort by directory",
		},
		L = {
			"<cmd>BufferOrderByLanguage<cr>",
			"Sort by language",
		},
	},
	h = {
		name = "Hop",
		w = { "<cmd>HopWord<CR>", "HopWord" },
		l = { "<cmd>HopLine<CR>", "HopLine" },
		c = { "<cmd>HopChar1<CR>", "HopChar1" },
		h = { "<cmd>nohlsearch<CR>", "No Highlight" },
	},
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	-- " Available Debug Adapters:
	-- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
	-- " Adapter configuration and installation instructions:
	-- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
	-- " Debug Adapter protocol:
	-- "   https://microsoft.github.io/debug-adapter-protocol/
	-- " Debugging
	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},

	l = {
		name = "LSP",

		a = { "<cmd>lua require('lvim.core.telescope').code_actions()<cr>", "Code Action" },
		d = {
			"<cmd>Telescope lsp_document_diagnostics<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		p = {
			name = "Peek",
			d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
			t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
			i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
		},
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Diagnostics List" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		r = { "<cmd>Telescope resume<cr>", "Telescope Resume" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		p = {
			"<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
			"Colorscheme with Preview",
		},
	},
	T = {
		name = "Treesitter",
		i = { ":TSConfigInfo<cr>", "Info" },
	},
	-- t = {
	--     name = "Terminal",
	--     n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
	--     u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
	--     t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
	--     p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
	--     f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
	--     h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
	--     v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	-- },
	-- L = {
	--   name = "+LunarVim",
	--   c = {
	--     "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>",
	--     "Edit config.lua",
	--   },
	--   f = {
	--     "<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
	--     "Find LunarVim files",
	--   },
	--   g = {
	--     "<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>",
	--     "Grep LunarVim files",
	--   },
	--   k = { "<cmd>lua require('lvim.keymappings').print()<cr>", "View LunarVim's default keymappings" },
	--   i = {
	--     "<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
	--     "Toggle LunarVim Info",
	--   },
	--   I = {
	--     "<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
	--     "View LunarVim's changelog",
	--   },
	--   l = {
	--     name = "+logs",
	--     d = {
	--       "<cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<cr>",
	--       "view default log",
	--     },
	--     D = {
	--       "<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
	--       "Open the default logfile",
	--     },
	--     l = {
	--       "<cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>",
	--       "view lsp log",
	--     },
	--     L = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Open the LSP logfile" },
	--     n = {
	--       "<cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
	--       "view neovim log",
	--     },
	--     N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
	--     p = {
	--       "<cmd>lua require('lvim.core.terminal').toggle_log_view('packer.nvim')<cr>",
	--       "view packer log",
	--     },
	--     P = { "<cmd>exe 'edit '.stdpath('cache').'/packer.nvim.log'<cr>", "Open the Packer logfile" },
	--   },
	--   r = { "<cmd>LvimReload<cr>", "Reload LunarVim's configuration" },
	--   u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
	-- },
}

local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	["/"] = { '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
}

which_key.setup(which_key_settings)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
