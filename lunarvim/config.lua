-- my config

vim.opt.ruler          = true
vim.opt.termguicolors  = true
vim.opt.list           = true
vim.opt.foldcolumn     = "1"
vim.opt.foldlevel      = 99
vim.opt.foldlevelstart = -1
vim.opt.foldenable     = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "space:⋅"
-- vim.opt.spell         = true
-- vim.opt.spelllang     = "en"
-- vim.opt.listchars:append "eol:↴"

-- lvim.transparent_window = true
lvim.foldmethod     = 'expr'
lvim.log.level      = "warn"
lvim.format_on_save = true
lvim.leader         = "space"
lvim.colorscheme    = 'lunar'
-- nvcode || material || darkplus || github-theme || omni || rose-pine
-- catppuccin || onedark || onedarkpro || kanagawa

local components                        = require('lvim.core.lualine.components')
lvim.builtin.lualine.options.theme      = 'modus-vivendi'
lvim.builtin.lualine.sections.lualine_z = { components.spaces, components.location, components.scrollbar }
lvim.builtin.lualine.sections.lualine_y = { components.progress }
lvim.builtin.treesitter.rainbow.enable  = true

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.telescope.extensions.project = {}
lvim.builtin.telescope.defaults.file_ignore_patterns = { "node%_modules/.*", ".git/.*", "tags" }


lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<C-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<C-p>"] = ":Telescope resume<cr>"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "c_sharp",
  "javascript",
  "json",
  "lua",
  "python",
  -- "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "php",
  "phpdoc",
  "http",
  "yaml",
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
  { "folke/trouble.nvim", cmd = "TroubleToggle" },
  { "williamboman/nvim-lsp-installer" },
  { "nvim-treesitter/nvim-treesitter-angular" },
  { 'nvim-telescope/telescope-smart-history.nvim' },
  { 'nvim-telescope/telescope-project.nvim' },
  { 'nvim-telescope/telescope-media-files.nvim' },
  { 'ludovicchabant/vim-gutentags' },
  { 'jghauser/mkdir.nvim' },
  { 'diepm/vim-rest-console' },
  { "ellisonleao/dotenv.nvim" },
  { 'onsails/lspkind.nvim' },
  { "p00f/nvim-ts-rainbow" },
  { 'Nash0x7E2/awesome-flutter-snippets' },
  { "hollowtree/vscode-vue-snippets" },
  { "tpope/vim-repeat" },
  { "wakatime/vim-wakatime" },
  { 'rottencandy/vimkubectl' },
  { 'nanotee/sqls.nvim' },
  { 'MunifTanjim/prettier.nvim' },
  { 'sbdchd/neoformat' },
  { 'manzeloth/live-server' },
  { "max397574/better-escape.nvim" },
  { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' },
  { "metakirby5/codi.vim", cmd = "Codi" },
  { "felipec/vim-sanegx", event = "BufRead" },
  { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' },
  { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' },
  -- { 'puremourning/vimspector' },
  -- { 'anuvyklack/pretty-fold.nvim' },
  -- { 'nvim-telescope/telescope-vimspector.nvim' },
  -- { 'stephpy/vim-php-cs-fixer' },
  -- { "petertriho/nvim-scrollbar" },
  -- { 'quick-lint/quick-lint-js' },
  -- { 'yamatsum/nvim-cursorline' },
  -- { "andrejlevkovitch/vim-lua-format" },
  -- { 'gorbit99/codewindow.nvim' },
  -- { "nvim-treesitter/playground", event = "BufRead" },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  { 'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { "turbio/bracey.vim",
    cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
    run = "npm install --prefix server",
  },
  {
    "andymass/vim-matchup",
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  { "cuducos/yaml.nvim",
    ft = { "yaml" },
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim"
    },
  },
  { "someone-stole-my-name/yaml-companion.nvim",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
  },
  {
    "pwntester/octo.nvim",
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    'rmagatti/session-lens',
    requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('session-lens').setup({})
    end
  },
  { "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          default = { 'class', 'function', 'method' },
        },
      }
    end
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
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 25; -- Height of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
      }
    end
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
  { "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end
  },
  -- { "f-person/git-blame.nvim",
  --   event = "BufRead",
  --   config = function()
  --     vim.cmd "highlight default link gitblame SpecialComment"
  --     vim.g.gitblame_enabled = 0
  --   end,
  -- },
  -- { 'anuvyklack/fold-preview.nvim',
  --   requires = 'anuvyklack/keymap-amend.nvim',
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

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "project")
  pcall(telescope.load_extension, "media_files")
  pcall(telescope.load_extension, "smart_history")
  pcall(telescope.load_extension, "session-lens")
  pcall(telescope.load_extension, "yaml_schema")
  -- pcall(telescope.load_extension, "vimspector")
end

require("luasnip.loaders.from_vscode").lazy_load() -- You can pass { paths = "./my-snippets/"} as well
require("flutter-tools").setup {}
require("lvim.lsp.manager").setup("angularls")
require("nvim-lsp-installer").setup({ automatic_installation = true })
require('dotenv').setup {}
require('ufo').setup()
require('lspconfig').yamlls.setup {}
require("better_escape").setup { mapping = { "jk", "jj" } }
require('lspkind').init({})
require('lspconfig').sqls.setup {
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr)
  end
}
require('lspconfig').gopls.setup {
  settings = { gopls = { gofumpt = true } }
}

require("indent_blankline").setup {
  char = "",
  char_highlight_list = { "IndentBlanklineIndent1", "IndentBlanklineIndent2" },
  space_char_highlight_list = { "IndentBlanklineIndent1", "IndentBlanklineIndent2" },
  show_trailing_blankline_indent = false,
}

require('prettier').setup({
  bin = 'prettier',
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
    "yaml",
  },

  cli_options = {
    arrow_parens = "always",
    bracket_spacing = true,
    bracket_same_line = false,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    -- jsx_bracket_same_line = false,
    jsx_single_quote = false,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_attribute_per_line = false,
    single_quote = false,
    tab_width = 2,
    trailing_comma = "es5",
    use_tabs = false,
    vue_indent_script_and_style = false,
  },
})

-- local codewindow = require('codewindow')
-- codewindow.setup()
-- codewindow.apply_default_keybinds()

-- require('pretty-fold').setup()
-- require('fold-preview').setup()
-- require('glow').setup({
--   style = "dark",
--   width = 120,
-- })
-- require('nvim-cursorline').setup {
--   cursorline = { enable = false, timeout = 300, number = false },
--   cursorword = { enable = true, min_length = 3, hl = { underline = true } }
-- }
-- require("ufo").setup {
--   provider_selector = function(bufnr, filetype)
--     return { "lsp", "treesitter", "indent" }
--   end,
-- }



local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.emmet_ls.setup({
  -- emmit , first run npm install -g emmet-ls
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = { html = { options = { ["bem.enabled"] = true } } }
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "javascript", "typescript", "typescriptreact", "vue" },
    -- args = {
    --   '--print-width=100',
    --   '--single-quote=true',
    --   '--tab-width=2',
    --   '--semi=true',
    --   '--bracket-same-line=true',
    --   '--vue-indent-script-and-style=true',
    --   '--jsx-bracket-same-line=true',
    --   '--prose-wrap=preserve',
    --   '--end-of-line=lf'
    -- },
  },
  { command = "autopep8", filetypes = { "python" } }, --  pip install pycodestyle autopep8
  { command = "prettier", filetypes = { "php" } }, -- npm install -g prettier @prettier/plugin-php
  { command = "gofmt", filetypes = { "go" } },
}

vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

vim.api.nvim_command("augroup user_plugin_cursorword")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
vim.api.nvim_command("augroup END")
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)


-- lvim.builtin.telescope.defaults.history.path = '~/.local/share/nvim/telescope_history'
-- lvim.builtin.telescope.defaults.history.limit = 100

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings['i'] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show Documentions" }
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
lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  s = { "<cmd>:Telescope session-lens search_session<cr>", "search sessions" },
}

-- require('telescope').extensions.vimspector.configurations()
-- lvim.builtin.which_key.mappings['D'] = {
--   name = "Vimspector",
--   G = { "<cmd>lua require('config.vimspector').generate_debug_profile()<cr>", "Generate Debug Profile" },
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
