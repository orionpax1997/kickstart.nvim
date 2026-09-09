-- https://github.com/MeanderingProgrammer/render-markdown.nvim
--
-- 渲染 Markdown 文件：标题/代码块/引用/列表/表格/链接等。
-- 依赖（已在 kickstart 加载，无需重复添加）：
--   - nvim-treesitter/nvim-treesitter
--   - nvim-mini/mini.nvim  （用于 mini.icons）

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {
  -- 在 normal/cmdline/terminal 模式下渲染
  render_modes = { 'n', 'c', 't' },

  -- 启动后立刻打开 markdown 文件就开始渲染
  enabled = true,

  -- 调用内置补全（需要 markdown / markdown_inline treesitter parser）
  completions = { lsp = { enabled = true } },

  -- 常用的小调整（可按需修改）
  latex = {
    -- 需要 :TSInstall latex + 系统装 pylatexenc，否则会自动禁用
    enabled = false,
  },
  -- 大文件自动关闭渲染（行数阈值）
  file_types = { 'markdown' },
}

-- 切换原始/渲染视图（个人常用键位示例，可按需改）
vim.keymap.set('n', '<leader>tp', '<cmd>RenderMarkdown toggle<CR>', { desc = '[T]oggle [P]review Markdown' })
