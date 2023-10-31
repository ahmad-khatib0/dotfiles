lvim.log.level = "warn"
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.guifont = "FiraCode:h20"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.pumheight = 14
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.expandtab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.spellsuggest = 9
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8


vim.opt.colorcolumn = "99999"
lvim.foldmethod = "nvim_treesitter#foldexpr()"
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

lvim.log.level = "warn"
lvim.builtin.dap.active = true
vim.opt.ruler = true
vim.opt.termguicolors = true
vim.opt.encoding = "utf-8"

vim.o.background = "dark"
lvim.colorscheme = "vscode"

lvim.leader = "space"
lvim.format_on_save.enabled = true
vim.diagnostic.config({ virtual_text = false })

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.telescope.extensions.project = {}
lvim.builtin.telescope.defaults.file_ignore_patterns = { "node%_modules/.*", ".git/.*", "tags" }

-- lvim.builtin.treesitter.matchup.enable = true


lvim.builtin.treesitter.ensure_installed = {
  "vue"
}

require("mason-tool-installer").setup({
  run_on_start = true,
  ensure_installed = {
    "rust-analyzer",
    "vue-language-server",
  }
})

--  ********************************************************************************
--  ********************************** keybindings *********************************
--  ********************************************************************************

-- unset
lvim.builtin.which_key.mappings["?"] = {}
lvim.builtin.which_key.mappings[";"] = {}

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-q>"] = ":%bd|e#<CR>"
lvim.keys.normal_mode["<C-PageDown>"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<C-PageUp>"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope resume<cr>"
lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["H"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Documentions" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  T = { "<cmd>TodoTelescope<cr>", "Todo" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings["tt"] = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle Diagnostics" }

lvim.builtin.which_key.mappings["F"] = {
  name = "Flutter",
  q = { ":FlutterQuit<CR>", "Quit" },
  d = { ":FlutterDevices<CR>", "Devices" },
  g = { ":FlutterOutlineToggle<CR>", "Outline Toggle" },
  e = { ":FlutterEmulators<CR>", "Emulators" },
  D = { ":FlutterDevTools<CR>", "DevTools" },
  C = { ":FlutterCopyProfilerUrl<CR>", "Copy Profile URL" },
  c = { ":FlutterLogClear<CR>", "Clear Logs" },
  p = { ":FlutterPubGet<CR>", "Get Packages" },
  R = { ":FlutterRename", "Rename" },
}

lvim.builtin.which_key.mappings["Fr"] = {
  name = "R",
  r    = { ":FlutterRun<CR>", "Run" },
  e    = { ":FlutterReload<CR>", "Reload" },
  s    = { "FlutterRestart:<CR>", "Restart" },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  r = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.builtin.which_key.mappings["G"] = {
  name = "Go",
  t = { ":GoAddTags<CR>", "Add struct tags" },
  U = { ":GoUpdateBinaries<CR>", "Update Binaries" },
  I = { ":GoInstallDeps<CR>", "Install Deps" },
}
lvim.builtin.which_key.mappings["Gc"] = {
  name = "Coverage",
  b = { ":GoCoverageBrowser<CR>", "Browser" },
}
lvim.builtin.which_key.mappings["Gf"] = {
  name = "Fill",
  e = { ":GoIfErr<CR>", "If error" },
  s = { ":GoFillStruct<CR>", "Fill struct" }
}
lvim.builtin.which_key.mappings["Gm"] = {
  name = "Mod",
  t = { ":GoModTidy<CR>", "Tidy" },
  i = { ":GoModInit github.com/ahmad-khatib0/go/", "Init" }
}

lvim.builtin.which_key.mappings["r"] = {
  name = "replace",
  t = { ":lua require('spectre').toggle()<cr>", "toggle" },
  a = { ":lua require('spectre.actions').run_replace()<cr>", "replace all" },
  e = { ":lua require('spectre').toggle_line()<cr>", "exclude" }
}

lvim.builtin.which_key.mappings["gt"] = {
  name = "tools",
}

lvim.builtin.which_key.mappings["a"] = {
  name = "Actions",
}

lvim.builtin.which_key.mappings["ar"] = {
  name = "Remove",
  c = { "<cmd>:g/\\s*\\/\\//d<cr>", "remove all comments" }
}

lvim.builtin.which_key.mappings["u"] = {
  name = "utils",
  P = { "<cmd>:VCoolor<cr>", "Color Picker" }
}

lvim.builtin.which_key.mappings["df"] = { "<cmd>:lua require('dapui').float_element()<cr>", "floating" }
lvim.builtin.which_key.mappings["dh"] = { "<cmd>:lua require('dapui').eval()<cr>", "hover value" }


vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "F", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "t", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set("", "T", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

--  ********************************************************************************
--  *********************************** Plugins ************************************
--  ********************************************************************************
lvim.plugins = {
  { "Mofiqul/vscode.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "nvim-pack/nvim-spectre",
    config = function()
      require("spectre").setup({})
    end
  },                                  -- replace text,
  { "LudoPinelli/comment-box.nvim" }, -- Clarify and beautify your comments
  { "mg979/vim-visual-multi" },       --  Multiple cursors
  { "p00f/nvim-ts-rainbow" },
  { "tpope/vim-repeat" },
  { "AndrewRadev/splitjoin.vim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  { "KabbAmine/vCoolor.vim" }, -- color picker
  { "rafamadriz/friendly-snippets" },
  -- {
  --   "sudormrfbin/cheatsheet.nvim",
  --   requires = {
  --     { 'nvim-lua/popup.nvim' },
  --   },
  -- }, -- nvim cheatsheat
  { "sbdchd/neoformat" },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "smjonas/inc-rename.nvim", -- Incremental LSP renaming
    config = function()
      require("inc_rename").setup({})
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
    config = function()
      require("ufo").setup({})
    end,
  },
  {
    "narutoxy/dim.lua", --  Dim unused words
    config = function()
      require("dim").setup({})
    end,
  },
  {
    "ErichDonGubler/lsp_lines.nvim", -- fix Windows issues with `packer.nvim`
    config = function()
      require("lsp_lines").setup()
    end,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    config = function()
      require("pretty-fold").setup()
    end,
  },
  {
    "anuvyklack/fold-preview.nvim",
    requires = "anuvyklack/keymap-amend.nvim",
    config = function()
      require("fold-preview").setup()
    end,
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = { "html", "xml", "javascript", "gohtml", "gohtmltmpl", "php", "jet" },
      })
    end,
  },
  -- {
  --   "andymass/vim-matchup",
  --   event = "CursorMoved",
  --   config = function()
  --     vim.g.matchup_matchparen_offscreen = { method = "popup" }
  --   end,
  -- },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RRGGBBAA = true,
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true,    -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },

  {
    "kevinhwang91/nvim-bqf", -- Better quickfix window
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },

  -- jenkinsfile
  { 'ckipp01/nvim-jenkinsfile-linter' },

  -- golang
  { "fatih/vim-go" },
  {
    "olexsmir/gopher.nvim",
    config = function()
      require("gopher").setup({})
    end,
  },
  {
    "ray-x/go.nvim",
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },

  -- git
  {
    "kdheepak/lazygit.nvim",
    run = "sudo dnf copr enable atim/lazygit -y && sudo dnf install lazygit",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "tanvirtin/vgit.nvim",
    config = function()
      require("vgit").setup({
        settings = {
          live_blame = { enabled = false },
        },
      })
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    tag = "*",
    config = function()
      require("git-conflict").setup()
    end,
  },

  -- javascript
  { "hollowtree/vscode-vue-snippets" },

  -- flutter
  { "Nash0x7E2/awesome-flutter-snippets" },
  {
    "akinsho/flutter-tools.nvim",
    config = function()
      require("flutter-tools").setup({})
    end,
  },

  -- rust
  { "simrat39/rust-tools.nvim" },

  -- dap plugins
  { "ravenxrz/DAPInstall.nvim" },
  { "mfussenegger/nvim-dap-python" },
  {
    "leoluz/nvim-dap-go",
    module = "dap-go"
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
}



--  ********************************************************************************
--  ********************************* Lsp Settings *********************************
--  ********************************************************************************
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = {
    "html",
    "typescriptreact",
    "javascriptreact",
    "javascript",
    "css",
    "sass",
    "scss",
    "less",
    "tmpl",
    "gohtmltmpl",
    "gohtml",
    "jet",
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
})

lspconfig.volar.setup({
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
  nit_options = {
    typescript = {
      tsdk = "~/.nvm/versions/node/v20.3.0/lib/node_modules/typescript/lib",
    },
  },
})

require("lspconfig").vuels.setup({})

require("flutter-tools").setup {
  root_patterns = { ".git", "pubspec.yaml" }, -- patterns to find the root of your flutter project
  widget_guides = {
    enabled = false,
  },

  dev_log       = {
    enabled = true,
    notify_errors = false, -- if there is an error whilst running then notify the user
    -- open_cmd = "vim ~/Downloads/test/flutter-logs.txt", -- command to use to open the log buffer
  },

  dev_tools     = {
    autostart = false,         -- autostart devtools server if not detected
    auto_open_browser = false, -- Automatically opens devtools in the browser
  },

  outline       = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
    auto_open = false    -- if true this will open the outline automatically when it is first populated
  },

  debugger      = {
    enabled = true,
    run_via_dap = true,
    -- exception_breakpoints = "default",
  },

  decorations   = {
    statusline = {
      device = true,
    }
  },

  lsp           = {
    color = {
      enabled = true,
      virtual_text_str = "■" -- "■",
    }
  },

  settings      = {
    updateImportsOnRename = true,
  }
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "dap")
  pcall(telescope.load_extension, "lazygit")
end

--  *************************************************************************************
--  ********************************* Plugins Settings *********************************
--  *************************************************************************************

require("luasnip.loaders.from_vscode").lazy_load() -- You can pass { paths = "./my-snippets/"} as well

local rustTools = require("rust-tools")
rustTools.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<C-space>", rustTools.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rustTools.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

require('comment-box').setup({
  doc_width = 120, -- width of the document
  box_width = 110, -- width of the boxes
})

--  ********************************************************************************
--  ********************************* Formatters *********************************
--  ********************************************************************************

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "prettier",
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
      "css",
      "less",
      "scss",
      "json",
      "graphql",
      "markdown",
      "yaml",
    },
    args = {
      "--arrow-parens=always",
      "--bracket-spacing=true",
      "--bracket-same-line=true",
      "--html-whitespace-sensitivity=css",
      "--jsx-bracket-same-line=true",
      "--print-width=110",
      "--quote-props=as-needed",
      "--single-quote=true",
      "--semi=false",
      "--tab-width=2",
      "--single-attribute-per-line=false",
      "--vue-indent-script-and-style=false",
      "--trailing-comma=all",
      "--use-tabs=false",
      "--prose-wrap=preserve",
      "--end-of-line=lf",
    },
  },
  { command = "autopep8", filetypes = { "python" } }, --  pip install pycodestyle autopep8
  { command = "fixjson",  filetypes = { "json" } },
  { command = "prettier", filetypes = { "php" } },    -- npm install -g prettier @prettier/plugin-php
  { command = "gofmt",    filetypes = { "go" } },
  { name = "dart_format", args = { "--line-length=120" } }
})


-- ****************************************************************************************
-- ********************************** Autocommands ****************************************
-- ****************************************************************************************
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.gohtml", "*.jet" },
  command = "set filetype=gohtmltmpl",
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*.yaml" },
  command = ":LspStop yamlls",
})

lvim.autocommands = {
  { "BufWrite", { pattern = { "*.lua" }, command = ":Neoformat stylua" } },
  -- { "BufWrite",    { pattern = { "*.vue" }, command = ":Prettier" } },
  {
    "BufWrite",
    {
      -- pattern = { "*.js", "*.ts", "*.vue", "*.jsx", "*.html", "*.scss", "*.css" },
      pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.html", "*.scss", "*.css" },
      command = ":Neoformat prettier",
    },
  },
}

--  *************************************************************************************
--  ********************************* Debugging Settings *********************************
--  *************************************************************************************

local dap_install = require("dap-install")
dap_install.setup({
  installation_path = "/home/ahmad-khatib/debuggers/",
})

local dap = require("dap")

-- require("dap-vscode-js").setup({
--   adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
-- })

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] =
  {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    }
  }
end

dap.adapters.go = {
  type = "executable",
  command = "node",
  args = { "/home/ahmad-khatib/debuggers/go/vscode-go/dist/debugAdapter.js" },
}

dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    showLog = false,
    program = "${file}",
    dlvToolPath = vim.fn.exepath("dlv"),
  },
}

require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = "dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
    build_flags = "",
  },
}

dap.adapters.dart = {
  type = "executable",
  command = "dart",
  -- This command was introduced upstream in https://github.com/dart-lang/sdk/commit/b68ccc9a
  args = { "debug_adapter" }
}

dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch Dart Program",
    -- The nvim-dap plugin populates this variable with the filename of the current buffer
    program = "${file}",
    -- The nvim-dap plugin populates this variable with the editor's current working directory
    cwd = "${workspaceFolder}",
    args = { "--help" }, -- Note for Dart apps this is args, for Flutter apps toolArgs
    -- flutterMode = "debug"
  }
}

--  ****************************************************************************************************
--  ****************************************************************************************************
--  *********************************         INFORMATION              *********************************
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
-- To see if a particular key has already been bound:       :verbose map <TAB>
-- :nmap for normal, :vmap for visual, :imap for insert.
--
--- ****************************************************************************************************
--- ****************************************************************************************************
--  *************************************** Sidebar Commands *******************************************
--  ****************************************************************************************************
--  ****************************************************************************************************

-- Lsp   &&     Mason      &&        TS           &&     Packer    package managers
-- :Bracey                    live editing
-- :IncRename + pattern       rename a text
-- :Codi                      interactive floating window. (for php install psysh )
-- :Dap                       debug in nvim
-- :Kget | apply ....         kubernetes
-- :Neoformat  prettier       or any formatter
-- :LiveServer
-- :Octo                      git issues or PRs or .......... in nvim
-- :SaveSession | Search
-- :SymbolsOutline            toggle code tree
-- :TOhtml                    convert any file type to an html file with all lines sournded with spans
-- :COQnow                    will start coq_nvim  (autocomplete )
-- :DIInstall a-name-of-debuger  the list of available can be fund in the repo
-- google-chrome --remote-debugging-port=9222     lunches chrome
-- :Pantran interactive language translation ui
-- :vimgrep /\w\+/j % | copen      open quickfix
--
-- nvim-surround
-- ys{motion}{char}, ds{char}, and cs{target}{replacement}  => add/delete/change
--     Old text                    Command         New text
--------------------------------------------------------------------------------
-- surr*ound_words             ysiw)           (surround_words)
-- *make strings               ys$"            "make strings"
-- [delete ar*ound me!]        ds]             delete around me!
-- remove <b>HTML t*ags</b>    dst             remove HTML tags
-- 'change quot*es'            cs'"            "change quotes"
-- <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
-- delete(functi*on calls)     dsf             function calls
