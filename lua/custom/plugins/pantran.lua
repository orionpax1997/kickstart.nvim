-- https://github.com/potamides/pantran.nvim
--
-- Neovim 内置的交互式机器翻译窗口，支持 Google / DeepL / Argos / Yandex 等引擎。

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'potamides/pantran.nvim' }

-- 先 require，再做键位引用，避免 pantran 为 nil
local pantran = require('pantran')

pantran.setup {
  -- 默认引擎：argos 免费可用，也可改成 google / deepl / yandex
  default_engine = 'argos',
  -- 按需配置引擎参数，例如：
  -- engines = {
  --   yandex = { default_source = 'auto', default_target = 'zh' },
  -- },
}

-- 可视模式下选区翻译
vim.keymap.set('x', '<leader>t', pantran.motion_translate, {
  noremap = true,
  silent = true,
  expr = true,
  desc = '[T]ranslate',
})

-- 命令入口（备用）
-- :Pantran             打开交互式翻译窗口
-- :<count>Pantran      预填入 count 行文本
-- 文本对象支持：<leader>tris / <leader>trip（翻译所在句子/段落）
