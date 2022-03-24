# NeoVIM 0.5+ 设置文件

## 前言

从VSCode里面入坑Vim，慢慢发现VSCode里面Vim模式并不好用，操作逻辑和快捷键与VSCode的会有冲突。开始接触原生Vim，看了评测后开始使用NeoVIM，开始用Viml跟着网上的视频一步步设置配置自己的设置文件。鼓捣到Coc的时候NeoVIM公布了0.5的预告，全面启用Lua语言进行配置，同时开始启用原生的LSP。如果按照NeoVIM这条路走下去势必要对原来的Viml写的配置文件全面升级。中间看了不少的视频，对于新的配置逻辑完全不得要领。照搬了Git上面几个配置好的NeoVIM总有不满意的地方，不是md文件显示响应速度有问题就是某些设置无法实现。看了配置文件完全不知道是什么造成的Bug，很是让人头秃。

后来从B站的视频找到一系列视频和配置好的文件，还加了QQ群终于基本需求可以满足，可以在这个基础上进行自己的设置改造过程。

## 折腾过程记录 2022-03-24

更新内容
1. 在上一个版本的基础上增加了`nvim`里面的中文输入法,用来解决在`Mac`和`WSL`平台上`nvim`中文输入切换的问题
2. 增加了`EesyMontion`的`nvim`版本`hop.nvim`
3. 上一个版本里面的`format.nvim`在`github`上被原作者下架,改用`neoformat`.使用`neoformat`一样需要安装各个语言对应的格式化工具.目前安装的格式化工具如下:
| 语言   | 格式化工具    |
|--------------- | --------------- |
| c & cpp   | clang-format    |
| python   | autopep8 |
| lua   | Mac上装了待查 |

问题:
1. `nvim-ts-rainbow`或者`treesitter`存在BUG,在某些`cpp`或者`py`文件无法对括号进行渲染,相同的代码内容,新建一个文件换一个文件名就每问题
2. `Mac`平台上中文输入法词语下拉菜单显示不正常,在`WSL`上无问题
3. 在`WSL`平台上,`LSP`里面的`pyright`有问题卸载了之后还是有错误提示,打开`py`文件总提示找不到`pyright`,目前用`jedi`LSP功能倒是一切正常

注意事项:
1. `clang-format`在`Mac`和`WSL`上的配置文件内容不一样.在`WSL`上`.clang-format`文件还对缩进敏感,在`Mac`上就没事,也是醉了

## 折腾过程记录 2022-03-15

更新内容
1. 最开始是跟着用`vim script`配置的,后来0.5+出来开始往`lua`上面转,过程很痛苦,总是出现各种问题,集中在`lua`调用上.后来在youtube上跟着配置了一遍用着基本顺手.系列视频链接如下:[Neovim from Scratch](https://www.youtube.com/playlist?list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ).
目前跟着视频配置到16期,代码格式化跟着视频没有搞定,用其它视频里面的方法解决了,不过是比较笨的办法.视频链接如下:[Null-ls.nvim for formatting - Neovim Lua From Scratch #23](https://www.youtube.com/watch?v=jFXEQV9Fo1k&ab_channel=NeilSabde)
算下来从开始折腾`vim`到现在已经年多了,终于有点眉目也真是不容易.

问题:
1. 小哥说的代码格式化`null-ls.nvim`没有设置成功


## 2021年11月02日 起始配置说明--此部分作废

[原始配置说明系列教程列表索引](https://blog.csdn.net/lxyoucan/article/details/120641546) 

我是按照这个系列教程里面[17_注释插件](https://blog.csdn.net/lxyoucan/article/details/120998239)抄过来的。这个配置结合这个系列前面所有的配置，主要包括：LSP、 Snip、Treesitter等。经过试用即便可以满足我写python cpp Lua这些文件的简单需求。

因为Luasnip这个插件更新，链接里面百度网盘里面的配置文件启动Luasnip报错，经过与原作者修改QQ传了新的`snippets.lua`替换后问题解决。本repo里面的是更新过后的文件。
