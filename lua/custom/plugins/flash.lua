-- https://github.com/folke/flash.nvim
--
-- 快速跳转插件：通过搜索标签增强 f/t/F/T 移动、
-- 整合 / ? 搜索、并提供 Treesitter 节点跳转。

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'folke/flash.nvim' }

require('flash').setup {}

-- 推荐的键位（来自官方 README）。注意：使用 lua 函数而非 `:lua`，
-- 以保证 dot-repeat 可用。
local function flash_jump() require('flash').jump() end
local function flash_treesitter() require('flash').treesitter() end
local function flash_remote() require('flash').remote() end
local function flash_treesitter_search() require('flash').treesitter_search() end
local function flash_toggle() require('flash').toggle() end

vim.keymap.set({ 'n', 'x', 'o' }, 's', flash_jump, { desc = 'Flash' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', flash_treesitter, { desc = 'Flash Treesitter' })
vim.keymap.set('o', 'r', flash_remote, { desc = 'Remote Flash' })
vim.keymap.set({ 'o', 'x' }, 'R', flash_treesitter_search, { desc = 'Treesitter Search' })
vim.keymap.set('c', '<c-s>', flash_toggle, { desc = 'Toggle Flash Search' })
