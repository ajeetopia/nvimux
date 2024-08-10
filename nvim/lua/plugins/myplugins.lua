-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  --{ "ellisonleao/gruvbox.nvim" },
  
  {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
  }

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- Enable clangd for C++
  { import = "lazyvim.plugins.extras.lang.clangd" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "awk",
        "bash",
        "c",
        "cpp",
        "css",
        "csv",
        "cuda",
        "devicetree",
        "diff",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "glsl",
        "html",
        "http",
        "javascript",
        "json",
        "kconfig",
        "linkerscript",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "objc",
        "objdump",
        "passwd",
        "pem",
        "printf",
        "proto",
        "python",
        "query",
        "regex",
        "rst",
        "ssh_config",
        "strace",
        "todotxt",
        "udev",
        "vim",
        "xml",
        "yaml",
      },
    },
  },

  -- use mini.starter instead of alpha
  --{ import = "lazyvim.plugins.extras.ui.mini-starter" },
  -- tmux integration
  {
        "alexghergh/nvim-tmux-navigation",
        config = function()
            require("nvim-tmux-navigation").setup({ disable_when_zoomed = true })
        end
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
      },
    },
  },
}
