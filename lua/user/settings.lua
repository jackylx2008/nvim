local set = vim.opt
local cmd = vim.cmd
-- 是否在屏幕最后一行显示命令
set.showcmd = true
-- 是否开启语法高亮
set.syntax = "enable"
-- 是否特殊显示空格等字符
set.list = true
-- 设定自动缩进的策略为 plugin
set.filetype = "plugin"
-- 是否开启命令行补全
set.wildmenu = true
-- 是否开启单词拼写检查
set.spell = true
-- 设定单词拼写检查的语言
set.spelllang = "en_us,cjk"
-- 是否开启代码折叠
set.foldenable = true
-- 指定代码折叠的策略是按照缩进进行的
set.foldmethod = "indent"
-- 指定代码折叠的最高层级为 100
set.foldlevel = 100

-- set.textwidth = 80                      -- 经过试验发现这个参数对于英文采用空格分隔的文本有效，如果是中文没有空格分割就没有效果
set.textwidth = 0 -- 默认值为0，主要解决markdown文件中输入的时候一行太多了自动换行
set.hidden = true -- Required to keep multiple buffers open multiple buffers 跟缓存有关，似乎是与其他app的缓存互通，可以打开和浏览
-- setwindowlocal.wrap = true
set.wrap = true -- Display long lines as just one line 小哥说他不喜欢一长行的行号被分割？自动折行，原小哥设置是nowrap，写一根长句子不会自动折行，一行到底
set.encoding = "utf-8" -- The encoding displayed utf-8编码模式显示
set.pumheight = 10 -- Makes popup menu smaller 弹出窗口显示几行内容
set.fileencoding = "utf-8" -- The encoding written to file
set.ruler = true -- Show the cursor position all the time 显示光标所在的行号和列号
set.cmdheight = 2 -- More space for displaying messags 下方命令行高度

set.iskeyword:append({"-"}) -- treat dash separated words as a word text objec 字母含有'-'认为是一个单词
set.mouse = "a" -- Enable your mouse 在nvim界面可以用鼠标点击移动光标到点击位置
set.splitbelow = true -- Horizontal splits will automatically be below
set.splitright = true -- Vertical splits will automatically be to the right
vim.opt.termguicolors = true -- 设置采用True color
set.conceallevel = 0 -- So that I can see `` in markdown files
set.tabstop = 4 -- Insert 4 spaces for a tab
-- setbufferlocal.shiftwidth=4
-- setbufferlocal.tabstop=4
set.shiftwidth = 4 -- Change the number of space characters inserted for indentation
set.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
set.expandtab = true -- Converts tabs to spaces
-- setbufferlocal.expandtab = true                         -- Converts tabs to spaces
set.smartindent = true -- Makes indenting smart文件类型自动检测
set.autoindent = true -- Good auto indent自动换行对齐
-- setbufferlocal.autoindent = true
set.laststatus = 0 -- Always display the status line
set.relativenumber = false -- 设置相对行号
set.number = true -- set numbered lines
-- setwindowlocal.number = true                            -- Line numbers 显示行号
-- set.background = "dark" -- tell vim what the background color looks like
set.showtabline = 4 -- Always show tabs
set.showmode = false -- We don't need to see things like -- INSERT -- anymore
set.backup = false -- This is recommended by coc
set.writebackup = false -- This is recommended by coc
set.updatetime = 100 -- Faster completion
set.timeoutlen = 200 -- By default timeoutlen is 1000 ms

-- set.formatoptions-=cro                -- Stop newline continution of comments
cmd("au BufEnter * set formatoptions-=cro")
-- vim.opt_local.formatoptions = vim.opt_local.formatoptions - {"c", "r", "o"}

set.clipboard = "unnamedplus" -- Copy paste between vim and everything else app之间共享剪贴板

set.cursorline = true -- 突出显示当前行
set.cursorcolumn = true -- 突出显示当前列

-- Avoids updating the screen before commands are completed
set.lazyredraw = true

cmd("filetype plugin indent on") -- 根据语言设置不同的缩进
set.shortmess = "c"
set.whichwrap = "b,s,<,>,[,],h,l"
set.scrolloff = 8
set.sidescrolloff = 5
-- setwindowlocal.signcolumn = "yes"
set.signcolumn = "yes"

-- "随机选一个颜色风格
-- function RandomColorScheme()
--   let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")
--   exe 'so ' . mycolors[localtime() % len(mycolors)]
--   unlet mycolors
-- endfunctionc
set.colorcolumn = "99999" -- fixes indentline for now
vim.opt.completeopt = {"menuone", "noselect"} -- mostly just for cmp
-- set.foldmethod = "manual" -- folding, set to "expr" for treesitter based folding
set.guifont = "monospace:h17" -- the font used in graphical neovim applications
set.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
set.hlsearch = true -- highlight all matches on previous search pattern
set.ignorecase = true -- ignore case in search patterns
set.smartcase = true -- smart case
set.swapfile = false -- creates a swapfile
set.title = true -- set the title of window to the value of the titlestring
set.undofile = true -- enable persistent undo
set.numberwidth = 4 -- set number column width to 2 {default 4}
set.signcolumn = "yes" -- always show the sign column ,otherwise it would shift the text each time
-- 是否透明背景
vim.g.background_transparency = true
