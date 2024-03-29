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
lvim.lsp.diagnostics.virtual_text = false

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

lvim.builtin.treesitter.ignore_install = { "haskell", "yaml" }
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "yamlls" })

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
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings["tt"] = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle Diagnostics" }

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
  p = { "FlutterPubGet:<CR>", "Get Packages" },
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
  { "KabbAmine/vCoolor.vim" },       -- color picker
  { "sudormrfbin/cheatsheet.nvim" }, -- nvim cheatsheat
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
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

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
})

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

require("dap-vscode-js").setup({
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

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
  args = { "/home/ahmad-khatib/debuggers/vscode-go/dist/debugAdapter.js" },
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
