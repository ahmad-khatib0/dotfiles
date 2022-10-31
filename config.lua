--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- my config
vim.opt.ruler         = true
vim.opt.termguicolors = true
vim.opt.list          = true
-- vim.opt.spell = true
-- vim.opt.spelllang = "en"
-- vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "space:⋅"

lvim.foldmethod     = 'expr'
lvim.colorscheme    = 'nvcode' -- nvcode || material || darkplus || github-theme || omni || rose-pine
-- || catppuccin || onedark || onedarkpro || kanagawa
-- lvim.use_icons = false   -- to disable icons and use a minimalist setup, uncomment this
-- general
lvim.log.level      = "warn"
lvim.format_on_save = true
-- lvim.transparent_window = true

-- lualine config
local components                        = require('lvim.core.lualine.components')
lvim.builtin.lualine.options.theme      = 'modus-vivendi'
lvim.builtin.lualine.sections.lualine_z = { components.spaces, components.location, components.scrollbar }
lvim.builtin.lualine.sections.lualine_y = { components.progress }


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configurationskipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
  { "folke/trouble.nvim", cmd = "TroubleToggle" },
  { "lukas-reineke/indent-blankline.nvim" },
  { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' },
  { 'Nash0x7E2/awesome-flutter-snippets' },
  { "hollowtree/vscode-vue-snippets" },
  { "nvim-treesitter/nvim-treesitter-angular" },
  { 'yamatsum/nvim-cursorline' },
  { 'ludovicchabant/vim-gutentags' },
  { 'norcalli/nvim-colorizer.lua' },
  { 'jghauser/mkdir.nvim' },
  -- { 'anuvyklack/pretty-fold.nvim',
  --   config = function()
  --     require('pretty-fold').setup()
  --   end
  -- },
  -- { 'anuvyklack/fold-preview.nvim',
  --   requires = 'anuvyklack/keymap-amend.nvim',
  --   config = function()
  --     require('fold-preview').setup()
  --   end
  -- },

  -- colorschemes
  { 'cpea2506/one_monokai.nvim' },
  { 'christianchiarulli/nvcode-color-schemes.vim' },
  { 'projekt0n/github-nvim-theme' },
  { 'tiagovla/tokyodark.nvim' },
  { 'EdenEast/nightfox.nvim' },
  { 'catppuccin/nvim' },
  -- { "folke/tokyonight.nvim" },
  -- { 'metalelf0/jellybeans-nvim' },
  -- { 'tomasiser/vim-code-dark' },
  -- { 'navarasu/onedark.nvim' },
  -- { 'olimorris/onedarkpro.nvim' },
  -- { 'martinsione/darkplus.nvim' },
  -- { 'marko-cerovac/material.nvim' },
  -- { 'yonlu/omni.vim' },
  -- { 'Mofiqul/dracula.nvim' },
  -- { 'rose-pine/neovim' },
  -- { 'rebelot/kanagawa.nvim' },
  -- { 'ray-x/aurora' },

}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })



-- my config

lvim.builtin.which_key.mappings["F"] = {
  name = "+Flutter",
  r = { ":FlutterRun<CR>", "Run" },
  R = { ":FlutterReload<CR>", "Reload" },
  q = { ":FlutterQuit<CR>", "Quit" },
  d = { ":FlutterDevices<CR>", "Devices" },
  D = { ":FlutterDetach<CR>", "Detach" },
  g = { ":FlutterOutlineToggle<CR>", "Outline Toggle" },
  e = { ":FlutterEmulators<CR>", "Emulators" },
  t = { ":FlutterDevTools<CR>", "Copy Profile URL" },
  c = { ":FlutterCopyProfilerUrl<CR>", "Copy Profile URL" },
  o = { "FlutterRestart:<CR>", "Restart" },
}
lvim.builtin.which_key.mappings['d'] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show Documentions" }

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
require("indent_blankline").setup {
  char = "",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  show_trailing_blankline_indent = false,
}

require("luasnip.loaders.from_vscode").lazy_load() -- You can pass { paths = "./my-snippets/"} as well
require('nvim-cursorline').setup {
  cursorline = { enable = true, timeout = 300, number = false },
  cursorword = { enable = true, min_length = 3, hl = { underline = true } }
}
require("flutter-tools").setup {}
require('colorizer').setup {}
require("lvim.lsp.manager").setup("angularls")

-- require('onedark').setup { style = 'warm' }
-- require('onedark').load()
-- require('onedarkpro').setup({ dark_theme = "onedark_dark" })
-- :lua require("material.functions").find_style()
