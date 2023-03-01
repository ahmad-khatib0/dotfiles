--[[ lvim is the global options object Linters should be filled in as
     strings with either a global executable or a path to an executable
  ]]
-- general
lvim.log.level = "warn"
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.guifont = "firacode:h17" -- the font used in graphical neovim applications
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.pumheight = 14 -- pop up menu height
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
-- vim.opt.timeoutlen = 200 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true -- enable persistent undo, which allows for the undotree to be saved to a file when exiting a buffer
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = false -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
lvim.colorscheme = "tokyonight-moon"
lvim.foldmethod = "expr"
lvim.log.level = "warn"
lvim.builtin.dap.active = true
vim.opt.ruler = true
vim.opt.termguicolors = true
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.encoding = "utf-8"
lvim.leader = "space"
lvim.format_on_save.enabled = true
-- lvim.transparent_window = true

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.notify.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.telescope.extensions.project = {}
lvim.builtin.telescope.defaults.file_ignore_patterns = { "node%_modules/.*", ".git/.*", "tags" }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
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

require("mason-tool-installer").setup({
  run_on_start = true,
  ensure_installed = {
    "stylua",
    "prettier",
    "editorconfig-checker",
    "delve",
    "gofumpt",
    "goimports",
    "golangci-lint",
    "golines",
    "gotests",
  },
})

-- *********************************   generic LSP settings *********************************
-- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "sumneko_lua",
  "jsonls",
  "eslint",
  "volar",
  "vuels",
  "rust_analyzer",
}

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-q>"] = ":%bd|e#<CR>"
lvim.keys.normal_mode["<C-PageDown>"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<C-PageUp>"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope resume<cr>"
lvim.builtin.terminal.open_mapping = "<c-t>"

-- Or map default functionality to a different key:
-- lvim.lsp.buffer_mappings.normal_mode['gk'] = lvim.lsp.buffer_mappings.normal_mode['K']
--
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"        => or vim.keymap.set("n", "<C-q>", ":q<cr>" )
--
-- unmap a default keymapping                       => vim.keymap.del("n", "<C-Up>")
--
-- To remove keymappings set by Lunarvim:           => lvim.keys.normal_mode["<C-h>"] = false
--
-- To modify your LSP keybindings                   => lvim.lsp.buffer_mappings.[normal|visual|insert]_mode.
--
-- Remove a single Whichkey keybind                 => lvim.builtin.which_key.mappings['w'] = {}
--
-- LSP bindings take precedence over regular keybindings. So in order to use a key for a regular
-- binding, we have to remove it first
-- lvim.lsp.buffer_mappings.normal_mode['K'] = nil
-- lvim.keys.normal_mode['K'] = "<Cmd>echo Okay!<CR>"
--

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
-- for input mode
-- i = {
--   ["<C-j>"] = actions.move_selection_next,
--   ["<C-k>"] = actions.move_selection_previous,
--   ["<C-n>"] = actions.cycle_history_next,
--   ["<C-p>"] = actions.cycle_history_prev,
-- },
-- -- for normal mode
-- n = {
--   ["<C-j>"] = actions.move_selection_next,
--   ["<C-k>"] = actions.move_selection_previous,
-- },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

lvim.builtin.which_key.mappings["F"] = {
  name = "Flutter",
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

-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = { uninstall_server = "d", toggle_server_expand = "o", }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
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
--
--
-- *********************************   formatters *********************************
-- set a formatter, this will override the language server formatting capabilities (if it exists)
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

-- *********************************   linters  *********************************
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
--
-- *********************************   Autocommands  *********************************
-- -- Autocommands (https://neovim.io/doc/user/autocmd.html)
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
--

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "LudoPinelli/comment-box.nvim" }, -- Clarify and beautify your comments
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  { "nvim-treesitter/nvim-treesitter-angular" },
  { "christianchiarulli/nvcode-color-schemes.vim" },
  { 'martinsione/darkplus.nvim' },
  { 'quick-lint/quick-lint-js',
    rtp = 'plugin/vim/quick-lint-js.vim',
    tag = '2.11.0',
    opt = true,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require("typescript").setup({ debug = false })
    end,
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    config = function()
      require("flutter-tools").setup {}
    end,
  },
}

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

require("luasnip.loaders.from_vscode").lazy_load() -- You can pass { paths = "./my-snippets/"} as well
-- lspconfig.emmet_ls.setup({
--   -- emmit , first run npm install -g emmet-ls
--   capabilities = capabilities,
--   filetypes = { "html", "typescriptreact", "javascriptreact", "js", "vue", "css", "sass", "scss", "less" },
--   init_options = { html = { options = { ["bem.enabled"] = true } } },
-- })


require("lspconfig").volar.setup({
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
  nit_options = {
    -- typescript = {
    --   tsdk = "~/.nvm/versions/node/v14.18.1/lib/node_modules/typescript/lib",
    -- },
  },
})

--  ****************************************************************************************************
--  ****************************************************************************************************
--
--  *********************************         INFORMATION              *********************************
--  *********************************                                  *********************************
--  *********************************                                  *********************************
--  ****************************************************************************************************
--  ****************************************************************************************************

-- <C-\> <M-1/2/3>	toggleterm (terminal)	normal
-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │ TIP: <leader> is space by default, read :help keycodes for more key names    │
-- │ TIP: <M> is alt on Windows/Linux and option on MacOS                         │
-- │ TIP: Non-leader keybindings (for e.g. <C-\>, mentioned below and             │
-- │  others) can be viewed by pressing <backspace> in the which-key main menu    │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
--                     ╭────────────────────────────────-----------──╮
--                     │ key	        description	           mode    │
--                     │ K	       hover information	       normal  │
--                     │ gd	       go to definition	         normal  │
--                     │ gD	       go to declaration	       normal  │
--                     │ gr	       go to references	         normal  │
--                     │ gI	       go to implementation	     normal  |
--                     │ gs	       show signature help	     normal  │
--                     │ gl	       show line diagnostics     normal  │
--                     ╰─────────────────────────────────-----------─╯
--  ╭─────────────────────────────────────────────────────────╮
--  │  key	          description	                      mode   │
--  │  <leader>/	   comment	normal,                  visual  │
--  │ gb	            block comment	                   visual │
--  │  <M-k>	       move line(s) up	normal,          visual  │
--  │ <M-j>       	move line(s) down	normal,          visual │
--  ╰─────────────────────────────────────────────────────────╯

-- key	                           description	                              mode
-- <C-space>	                   show completion menu	                       insert
-- <CR> <C-y>	                    confirm	insert
-- <C-e>	                         abort	insert
-- <C-k> <Up> <Tab>	             select previous item	                       insert
-- <C-j> <Down> <S-Tab>       	   select next item	                         insert
-- <C-d>	                         scroll docs up	                           insert
-- <C-f>	                         scroll docs down	                         insert
-- <CR> <Tab>	                 jump to next jumpable in a snippet	           insert
-- <S-Tab>	                  jump to previous jumpable in a snippet	       insert
--
--
--To see if a particular key has already been bound:       :verbose map <TAB>
-- :nmap for normal, :vmap for visual, :imap for insert.