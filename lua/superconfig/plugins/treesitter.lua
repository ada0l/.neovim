return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    --tag = 'v0.9.0',
    opts = {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['a,'] = '@parameter.outer',
            ['i,'] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ['],'] = '@parameter.inner',
          },
          goto_previous_start = {
            ['[,'] = '@parameter.inner',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['>,'] = '@parameter.inner',
          },
          swap_previous = {
            ['<,'] = '@parameter.inner',
          },
        },
      },
      ensure_installed = {
        "bash",

        "c",
        "c_sharp",
        "cmake",
        "make",
        "cpp",
        "rust",

        "dockerfile",

        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",

        "go",
        "gomod",

        "html",
        "htmldjango",
        "json",
        "svelte",
        "vue",
        "css",
        "scss",
        "jsdoc",
        "javascript",
        "typescript",
        "prisma",

        "latex",

        "lua",
        "luadoc",
        "luap",

        "markdown",
        "markdown_inline",

        "php",
        "phpdoc",

        "python",

        "sql",

        "toml",

        "vim",
        "vimdoc",

        "http"
      },
      compilers = { "clang" },
      install = {
        prefer_git = false,
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
