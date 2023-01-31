-- my config

vim.opt.ruler = true
vim.opt.termguicolors = true
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.diagnostic.config({ virtual_lines = true })

-- vim.opt.list           = true
-- vim.opt.listchars:append "space: "
-- vim.opt.listchars:append "eol:↴"
-- vim.opt.spell         = true
-- vim.opt.spelllang     = "en"

-- lvim.transparent_window = true
-- lvim.colorscheme = "tokyonight-moon"
lvim.colorscheme = "codedark"
lvim.lsp.diagnostics.virtual_text = false
lvim.foldmethod = "expr"
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.leader = "space"
lvim.builtin.dap.active = true
-- nvcode || material || darkplus || github-theme || omni || rose-pine
-- catppuccin || onedark || onedarkpro || kanagawa

local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.options.theme = "modus-vivendi"
lvim.builtin.lualine.sections.lualine_z = { components.spaces, components.location, components.scrollbar }
lvim.builtin.lualine.sections.lualine_y = { components.progress }
lvim.builtin.treesitter.rainbow.enable = true

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.telescope.extensions.project = {}
lvim.builtin.telescope.defaults.file_ignore_patterns = { "node%_modules/.*", ".git/.*", "tags" }

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-l>"] = ":BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<C-h>"] = ":BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<C-q>"] = ":%bd|e#<CR>"
lvim.keys.normal_mode["<C-PageDown>"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<C-PageUp>"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope resume<cr>"

require("mason-tool-installer").setup({
  run_on_start = true,
  ensure_installed = { "codelldb", "rust-analyzer", "stylua", "shfmt", "shellcheck", "prettierd" },
})

require("nvim-lsp-installer").setup({ automatic_installation = true })
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.ensure_installed = {
  -- "typescript",
  "bash",
  "c",
  "cpp",
  "c_sharp",
  "javascript",
  "json",
  "lua",
  "python",
  "tsx",
  "css",
  "rust",
  "java",
  "php",
  "phpdoc",
  "http",
  -- "yaml",
  "dart",
  "comment",
  "diff",
  "dockerfile",
  "dot",
  "gitignore",
  "go",
  "html",
  "http",
  "java",
  "jsdoc",
  "json",
  "markdown",
  "pug",
  "regex",
  "scss",
  "solidity",
  "svelte",
  "graphql",
  "query",
  "vue",
}

lvim.plugins = {
  { "williamboman/nvim-lsp-installer" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  { "ryanoasis/vim-devicons" },
  { "nvim-treesitter/nvim-treesitter-angular" },
  { "nvim-telescope/telescope-smart-history.nvim" },
  { "nvim-telescope/telescope-project.nvim" },
  { "nvim-telescope/telescope-media-files.nvim" },
  { "nvim-telescope/telescope-file-browser.nvim" },
  { "ludovicchabant/vim-gutentags" },
  { "jghauser/mkdir.nvim" },
  { "diepm/vim-rest-console" },
  { "ellisonleao/dotenv.nvim" },
  { "onsails/lspkind.nvim" },
  { "p00f/nvim-ts-rainbow" },
  { "tpope/vim-repeat" },
  { "rottencandy/vimkubectl" },
  { "nanotee/sqls.nvim" },
  { "MunifTanjim/prettier.nvim" },
  { "sbdchd/neoformat" },
  { "manzeloth/live-server" },
  { "max397574/better-escape.nvim" },
  { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
  { "metakirby5/codi.vim", cmd = "Codi" },
  { "felipec/vim-sanegx", event = "BufRead" },
  { "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" },
  { "Nash0x7E2/awesome-flutter-snippets" },
  { "hollowtree/vscode-vue-snippets" },
  { "kevinhwang91/promise-async" },
  { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" },
  { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" },
  { "ravenxrz/DAPInstall.nvim" },
  { "mfussenegger/nvim-dap-python" },
  { "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } },
  { "leoluz/nvim-dap-go", module = "dap-go" },
  { "jbyuki/one-small-step-for-vimkind", module = "osv" },
  { "simrat39/rust-tools.nvim" },
  { "kylechui/nvim-surround" },
  { "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" },
  { "smjonas/inc-rename.nvim" },
  { "jubnzv/virtual-types.nvim" },
  { "jose-elias-alvarez/typescript.nvim" },
  { "crusj/structrue-go.nvim", branch = "main" },
  { "potamides/pantran.nvim" },
  { "rhysd/vim-fixjson" },
  { "ray-x/go.nvim" },
  { "dhruvasagar/vim-table-mode" },
  { "AndrewRadev/splitjoin.vim" },
  { "LudoPinelli/comment-box.nvim" },
  { "mg979/vim-visual-multi" },
  { "nacro90/numb.nvim" },
  { "folke/zen-mode.nvim" },
  { "kdheepak/lazygit.nvim" },
  { "jayli/vim-easycomplete" },
  { "SirVer/ultisnips" },
  { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function()
      require("trouble").setup({})
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    tag = "*",
    config = function()
      require("git-conflict").setup()
    end,
  },
  {
    "axelvc/template-string.nvim",
    config = function()
      require("template-string").setup()
    end,
  },
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup({})
    end,
  },
  { "MunifTanjim/nui.nvim" },
  {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
  },
  -- { "romgrk/barbar.nvim" },
  -- { 'lukas-reineke/indent-blankline.nvim' },
  -- { 'yamatsum/nvim-cursorline' },
  -- { 'nvim-telescope/telescope-vimspector.nvim' },
  -- { 'stephpy/vim-php-cs-fixer' },
  -- { 'quick-lint/quick-lint-js' },
  -- { 'gorbit99/codewindow.nvim' },
  -- { "petertriho/nvim-scrollbar" },
  -- { "nvim-treesitter/playground", event = "BufRead" },
  -- {
  --   "puremourning/vimspector",
  --   cmd = { "VimspectorInstall", "VimspectorUpdate" },
  --   fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
  --   config = function()
  --     require("config.vimspector").setup()
  --   end,
  --   disable = false ,
  -- },
  {
    "ErichDonGubler/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile",
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
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  },
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      })
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "turbio/bracey.vim",
    cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
    run = "npm install --prefix server",
  },
  {
    "andymass/vim-matchup",
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    "rmagatti/session-lens",
    requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
    config = function()
      require("session-lens").setup({})
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach()
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          default = { "class", "function", "method" },
        },
      })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({
        width = 120, -- Width of the floating window
        height = 25, -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
      })
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
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
  {
    "ms-jpq/coq_nvim",
    branch = "coq",
    requires = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      {
        "ms-jpq/coq.thirdparty",
        branch = "3p",
        config = function()
          require("coq_3p")({ { src = "copilot", short_name = "COP", accept_key = "<c-f>" } })
        end,
      },
    },
    config = function()
      vim.g.coq_settings = {
        auto_start = true,
        clients = {
          tree_sitter = { enabled = false },
          paths = { enabled = true, resolution = { "file" } },
          snippets = { enabled = true, warn = {} },
          tags = { enabled = false },
        },
        keymap = { recommended = false },
        display = {
          preview = { positions = { north = 4, south = nil, west = 2, east = 3 } },
        },
      }
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup({})
    end,
  },
  -- {
  --   "cuducos/yaml.nvim",
  --   ft = { "yaml" },
  --   requires = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },
  -- {
  --   "someone-stole-my-name/yaml-companion.nvim",
  --   requires = {
  --     { "neovim/nvim-lspconfig" },
  --     { "nvim-lua/plenary.nvim" },
  --     { "nvim-telescope/telescope.nvim" },
  --   },
  -- },
  -- { "gbprod/phpactor.nvim",
  --   run = require("phpactor.handler.update"), -- To install/update phpactor when installing this plugin
  --   requires = {
  --     "nvim-lua/plenary.nvim", -- required to update phpactor
  --     "neovim/nvim-lspconfig" -- required to automaticly register lsp serveur
  --   },
  --   config = function()
  --     require("phpactor").setup({})
  --   end
  -- },
  -- { "f-person/git-blame.nvim",
  --   event = "BufRead",
  --   config = function()
  --     vim.cmd "highlight default link gitblame SpecialComment"
  --     vim.g.gitblame_enabled = 0
  --   end,
  -- },

  -- colorschemes
  -- { "cpea2506/one_monokai.nvim" },
  { "christianchiarulli/nvcode-color-schemes.vim" },
  -- { "projekt0n/github-nvim-theme" },
  -- { "navarasu/onedark.nvim" },
  { "tiagovla/tokyodark.nvim" },
  -- { "EdenEast/nightfox.nvim" },
  -- { "catppuccin/nvim" },
  -- { "Shatur/neovim-ayu" },

  { "tomasiser/vim-code-dark" },
  -- { "olimorris/onedarkpro.nvim" },
  -- { "martinsione/darkplus.nvim" },
  -- { "marko-cerovac/material.nvim" },
  -- { "yonlu/omni.vim" },
  -- { "Mofiqul/dracula.nvim" },
  -- { "rose-pine/neovim" },
  -- { "rebelot/kanagawa.nvim" },
  -- { "ray-x/aurora" },
}

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "project")
  pcall(telescope.load_extension, "media_files")
  pcall(telescope.load_extension, "smart_history")
  pcall(telescope.load_extension, "session-lens")
  pcall(telescope.load_extension, "dap")
  pcall(telescope.load_extension, "file_browser")
  -- pcall(telescope.load_extension, "yaml_schema")
  -- pcall(telescope.load_extension, "vimspector")
end

require("telescope").load_extension("media_files")
require("refactoring").setup({})
require("todo-comments").setup({})
require("structrue-go").setup()
require("typescript").setup({ debug = false })
require("inc_rename").setup({})
-- require("nightfox").setup({})
-- vim.cmd("colorscheme nightfox")
require("luasnip.loaders.from_vscode").lazy_load() -- You can pass { paths = "./my-snippets/"} as well
require("flutter-tools").setup({})
require("go").setup()
require("dotenv").setup({})
require("better_escape").setup({ mapping = { "jk", "jj" } })
require("lspkind").init({})
require("ufo").setup()
require("nvim-surround").setup({})
require("package-info").setup()
require("lspconfig").sqls.setup({
  on_attach = function(client, bufnr)
    require("sqls").on_attach(client, bufnr)
  end,
})

require("lspconfig").gopls.setup({
  settings = { gopls = { gofumpt = true } },
})

-- require("lspconfig").yamlls.setup({})
require("lspconfig").tsserver.setup({})
require("lvim.lsp.manager").setup("angularls")
require("lspconfig").eslint.setup({}) -- npm i -g vscode-langservers-extracted
require("lspconfig").stylelint_lsp.setup({}) -- npm i -g stylelint-lsp
require("lspconfig").tailwindcss.setup({}) -- npm install -g @tailwindcss/language-server
require("lspconfig").vuels.setup({}) -- npm install -g vls
require("lspconfig").angularls.setup({}) -- npm install -g @angular/language-server
require("lspconfig").cssmodules_ls.setup({}) -- npm install -g cssmodules-language-server
require("lspconfig").dockerls.setup({}) -- npm install -g dockerfile-language-server-nodejs
require("lspconfig").volar.setup({
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
  nit_options = {
    typescript = {
      tsdk = "~/.nvm/versions/node/v14.18.1/lib/node_modules/typescript/lib",
    },
  },
})
-- require("shade").setup({
--   overlay_opacity = 50,
--   opacity_step = 1,
--   keys = {
--     brightness_up = "<C-Up>",
--     brightness_down = "<C-Down>",
--     toggle = "<F5>",
--   },
-- })

require("prettier").setup({
  bin = "prettier",
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    -- "yaml",
  },
  cli_options = {
    tab_width = 2,
    semi = false,
    single_quote = true,
    html_whitespace_sensitivity = "css",
    bracket_same_line = true,
    print_width = 110,
    parser = "vue",
    arrow_parens = "always",
    bracket_spacing = true,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    jsx_single_quote = true,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    single_attribute_per_line = false,
    trailing_comma = "all",
    use_tabs = false,
    vue_indent_script_and_style = false,
  },
})

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.emmet_ls.setup({
  -- emmit , first run npm install -g emmet-ls
  capabilities = capabilities,
  filetypes = { "html", "typescriptreact", "javascriptreact", "js", "vue", "css", "sass", "scss", "less" },
  init_options = { html = { options = { ["bem.enabled"] = true } } },
})

-- formatters and lintters config
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "prettier",
    filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "jsx", "html" },
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
  { command = "fixjson", filetypes = { "json" } },
  { command = "prettier", filetypes = { "php" } }, -- npm install -g prettier @prettier/plugin-php
  { command = "gofmt", filetypes = { "go" } },
})

--          keybindings
vim.api.nvim_command("augroup user_plugin_cursorword")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
vim.api.nvim_command("augroup END")
vim.api.nvim_command("autocmd BufEnter * lua vim.diagnostic.hide()")

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

-- lvim.builtin.telescope.defaults.history.path = '~/.local/share/nvim/telescope_history'
-- lvim.builtin.telescope.defaults.history.limit = 100
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["i"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show Documentions" }
lvim.builtin.which_key.mappings["lA"] = { "<cmd>:CodeActionMenu<cr>", "code actions menu" }
lvim.builtin.which_key.mappings["gL"] = { "<cmd>:LazyGit<cr>", "Lazy Git" }
lvim.builtin.which_key.mappings["gq"] = {
  name = "Resolve conflict",
  c = { "<cmd>:GitConflictChooseOurs <cr>", "Select the current changes." },
  i = { "<cmd>:GitConflictChooseTheirs<cr>", "Select the incoming changes" },
  b = { "<cmd>:GitConflictChooseBoth <cr>", "Select both changes" },
  n = { "<cmd>:GitConflictChooseNone <cr>", "Select none of the changes" },
  N = { "<cmd>:GitConflictNextConflict <cr>", "Move to the next conflict" },
  p = { "<cmd>:GitConflictPrevConflict <cr>", "Move to the previous conflict" },
  q = { "<cmd>:GitConflictListQf <cr>", "Get all conflict to quickfix" },
}

-- lvim.builtin.which_key.mappings['b'] = {
--
-- }

lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  l = { "<cmd>lua require('telescope.builtin').builtin()<cr>", "list telescope utils" },
  f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files" },
  m = { "<cmd>lua require'telescope.builtin'.command_history{}<cr>", "commands search" },
  a = { "<cmd>lua require'telescope.builtin'.autocommands{}<cr>", "vim options" },
  S = { "<cmd>lua require'telescope.builtin'.spell_suggest{}<cr>", "spell suggest" },
  h = { "<cmd>lua require'telescope.builtin'.highlights{}<cr>", "available highlights" },
  d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "preview definitions" },
  i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "preview implementation" },
  c = { "<cmd>lua require('goto-preview').close_all_win()<CR>", "close all windows of previewing" },
  r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "preview references" },
}
lvim.builtin.which_key.mappings["fo"] = {
  name = "Sessions",
  s = { "<cmd>lua require('session-lens').search_session()<cr>", "search sessions" },
  S = { "<cmd>SaveSession<cr>", "save sessions" },
  d = { "<cmd>DeleteSession<cr>", "delete sessions" },
}

lvim.builtin.which_key.mappings["r"] = {
  name = "Refactoring",
  s = { "<cmd>:lua require('refactoring').select_refactor()<cr>", "select" },
}

lvim.builtin.which_key.mappings["u"] = {
  name = "Utilities",
  o = { "<cmd>SymbolsOutline<cr>", "symbols outline" },
  b = { "<cmd>:CBclbox <cr>", "box around comment" },
  t = { "<cmd>:ToggleTerm<cr>", "terminal" },
  T = { "<cmd>:TableModeEnable<cr>", "Table enable" },
  Z = { "<cmd>:ZenMode<cr>", "Zen Mode" },
  w = { "<cmd>:Twilight<cr>", "Toggle twilight" },
  m = { "<cmd>:MarkdownPreview<cr>", "Markdown Preview" },
  q = { "<cmd>:EasyCompleteEnable<cr>", "Easycomplete" },
  Q = { "<cmd>:COQnow<cr>", "COQnow" },
}

lvim.builtin.which_key.mappings["uf"] = {
  name = "Fix",
  e = { "<cmd>:EslintFixAll<cr>", "Eslint Fix" },
}

lvim.builtin.which_key.mappings["ug"] = {
  name = "Split Join",
  s = { "<cmd>:SplitjoinSplit<cr>", "split a one-liner into multiple lines" },
  j = { "<cmd>:SplitjoinJoin<cr>", "join a block into a single-line statement" },
}

lvim.builtin.which_key.mappings["un"] = {
  name = "NPM",
  i = { "<cmd>lua require('package-info').install()<cr>", "install packages" },
  s = { "<cmd>lua require('package-info').show()<cr>", "show" },
  d = { "<cmd>lua require('package-info').delete()<cr>", "delete" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  d = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  D = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle Diagnostics" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
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
-- lvim.builtin.which_key.mappings["V"] = {
--   name = "Vimspector",
--   G = { "<cmd>lua require('config.vimspector').generate_debug_profile()<cr>", "Generate Debug Profile" },
--   L = { "<cmd>call vimspector#Launch()<cr>", "Lunch" },
--   I = { "<cmd>VimspectorInstall<cr>", "Install" },
--   U = { "<cmd>VimspectorUpdate<cr>", "Update" },
--   R = { "<cmd>call vimspector#RunToCursor()<cr>", "Run to Cursor" },
--   c = { "<cmd>call vimspector#Continue()<cr>", "Continue" },
--   i = { "<cmd>call vimspector#StepInto()<cr>", "Step Into" },
--   o = { "<cmd>call vimspector#StepOver()<cr>", "Step Over" },
--   s = { "<cmd>call vimspector#Launch()<cr>", "Start" },
--   t = { "<cmd>call vimspector#ToggleBreakpoint()<cr>", "Toggle Breakpoint" },
--   u = { "<cmd>call vimspector#StepOut()<cr>", "Step Out" },
--   S = { "<cmd>call vimspector#Stop()<cr>", "Stop" },
--   r = { "<cmd>call vimspector#Restart()<cr>", "Restart" },
--   x = { "<cmd>VimspectorReset<cr>", "Reset" },
--   H = { "<cmd>lua require('config.vimspector').toggle_human_mode()<cr>", "Toggle HUMAN mode" },
-- }

--     Debugging setup
-- vim.cmd([[
--      let g:vimspector_sidebar_width = 85
--      let g:vimspector_bottombar_height = 15
--      let g:vimspector_terminal_maxwidth = 70
-- ]])

-- require("dap-go").setup {}

require("dap-vscode-js").setup({
  node_path = "node",
  -- debugger_cmd = { "js-debug-adapter" },
  debugger_path = "/home/ahmad-khatib/debuggers/vscode-js-debug",
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
  log_file_path = "/home/ahmad-khatib/debuggers/vscode-js-debug/log/log.log",
  log_file_level = 3,
})

local dap = require("dap")

for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
    {
      name = "Launch",
      type = "pwa-node",
      request = "launch",
      program = "${file}",
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      protocol = "inspector",
      console = "integratedTerminal",
    },
    {
      name = "Attach to node process",
      type = "pwa-node",
      request = "attach",
      rootPath = "${workspaceFolder}",
      processId = require("dap.utils").pick_process,
    },
    {
      name = "Debug Main Process (Electron)",
      type = "pwa-node",
      request = "launch",
      program = "${workspaceFolder}/node_modules/.bin/electron",
      args = {
        "${workspaceFolder}/dist/index.js",
      },
      outFiles = {
        "${workspaceFolder}/dist/*.js",
      },
      resolveSourceMapLocations = {
        "${workspaceFolder}/dist/**/*.js",
        "${workspaceFolder}/dist/*.js",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
      skipFiles = { "<node_internals>/**" },
      protocol = "inspector",
      console = "integratedTerminal",
    },
    {
      type = "pwa-chrome",
      name = "Attach - Remote Debugging",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
  }
end

-- dap.adapters.firefox = {
--   type = 'executable',
--   command = 'node',
--   args = { '/home/ahmad-khatib/debuggers/vscode-firefox-debug/dist/adapter.bundle.js' },
-- }

-- dap.configurations.typescript = {
--   name = 'Debug with Firefox',
--   type = 'firefox',
--   request = 'launch',
--   reAttach = true,
--   url = 'http://localhost:3000',
--   webRoot = '${workspaceFolder}',
--   firefoxExecutable = '/usr/bin/firefox'
-- }

local codelldb_path = "/home/ahmad-khatib/debuggers/codelldb/extension/adapter/codelldb"

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = codelldb_path,
    args = { "--port", "${port}" },
  },
}

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
    dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
  },
}

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

local dap_install = require("dap-install")
dap_install.setup({
  installation_path = "/home/ahmad-khatib/debuggers/",
})

dap_install.config("php", {
  adapters = {
    type = "executable",
    command = "node",
    args = { "/home/ahmad-khatib/debuggers/php/vscode-php-debug/out/phpDebug.js" },
  },
  configurations = {
    {
      name = "run current script",
      type = "php",
      request = "launch",
      port = 9000,
      cwd = "${fileDirname}",
      program = "${file}",
      runtimeExecutable = "php",
    },
    {
      type = "php",
      request = "launch",
      name = "Listen for xdebug",
      port = 9003,
      log = true,
    },
  },
})

--         Autocommands
lvim.autocommands = {
  { "BufWrite", { pattern = { "*.lua" }, command = ":Neoformat stylua" } },
  { "BufWrite", { pattern = { "*.vue" }, command = ":Prettier" } },
  {
    "BufWrite", -- see `:h autocmd-events`
    {
      -- pattern = { "*.js", "*.ts", "*.vue", "*.jsx", "*.html", "*.scss", "*.css" },
      pattern = { "*.js", "*.ts", "*.jsx", "*.html", "*.scss", "*.css" },
      command = ":Neoformat prettier",
    },
  },
  { "BufWritePre", { pattern = { "*.go" }, command = ":GoFmt" } },
}

lvim.autocommands.custom_groups = {
  { "CursorHold", "*", "lua vim.diagnostic.open_float(0,{scope='line'})" },
}

require("lualine").setup({
  options = { theme = "tokyonight" },
})

--     notes
-- Lsp   &&     Mason      &&        TS           &&     Packer    package managers
-- :Bracey                    live editing
-- :Codi                      interactive floating window. (for php install psysh )
-- :Dap                       debug in nvim
-- :Kget | apply ....         kubernetes
-- :Neoformat  prettier       or any formatter
-- :LiveServer
-- :Octo                      git issues or PRs or .......... in nvim
-- :SaveSession | Search
-- :SymbolsOutline            toggle code tree
-- :TOhtml                    confert any file type to an html file with all lines sournded with spans
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
