-- https://github.com/folke/noice.nvim
--
-- 重写消息、命令行、popupmenu 的 UI，提供更漂亮的提示与历史记录窗口。
-- 依赖 nui.nvim（已被 neo-tree 间接引入）。

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'folke/noice.nvim' }

require('noice').setup {
  lsp = {
    -- 让 LSP hover/completion 的 Markdown 通过 Treesitter 渲染
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
    },
  },
  presets = {
    bottom_search = true,        -- 搜索仍使用底部经典命令行
    command_palette = true,      -- 命令行与补全菜单合并显示
    long_message_to_split = true,-- 长消息输出到 split
    inc_rename = false,
    lsp_doc_border = false,
  },
  -- 可选：启用 rainbow delimiter / 漂亮的分隔符
  -- 如果没装 nvim-notify，会自动回退到 noice 的 mini 通知视图。
}

-- 提示：安装完后运行 `:checkhealth noice` 检查依赖与 treesitter parser。
-- 常用命令：
--   :Noice          打开消息历史
--   :Noice last     上一次消息
--   :Noice errors   仅显示错误
--   :Noice history  同 :Noice
