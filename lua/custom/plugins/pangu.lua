-- https://github.com/hotoo/pangu.vim
--
-- 盘古之白：在中英文之间自动插入半角空白，并规范化中文标点排版。
-- 主要用于 Markdown / 纯文本等富文本格式，源码文件请勿启用自动排版。

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'hotoo/pangu.vim' }

-- 日期是否添加空白：`1` = 添加, `0` = 不添加（推荐 `1`）
vim.g.pangu_rule_date = 1

-- 仅对富文本文件类型在保存时自动规范化
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('custom_pangu', { clear = true }),
  pattern = { '*.markdown', '*.md', '*.text', '*.txt', '*.wiki', '*.cnx' },
  callback = function(args)
    -- 对 markdown/vimwiki/text 文件，保存前自动执行 :PanguAll
    vim.cmd('PanguEnable')
    pcall(vim.cmd.PanguAll)
  end,
})

-- 可视模式/操作中使用：
--   :Pangu          格式化当前行或选区
--   :PanguAll       格式化整个缓冲区
--   :PanguDisable   关闭自动排版
--   :PanguEnable    开启自动排版
