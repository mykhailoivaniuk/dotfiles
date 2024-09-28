return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "javascript",
                    "typescript",
                    "go",
                    "rust",
                    "python",
                    "kotlin",
                    "prisma",
                    "dockerfile",
                    "json",
                    "cmake",
                    "cpp",
                    "css",
                    "yaml",
                    "sql",
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = true,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,
                },
            })
        end,
    },
}
