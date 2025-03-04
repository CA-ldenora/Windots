return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "bash",
            "bicep",
            "css",
            "c_sharp",
            "gitignore",
            "go",
            "gomod",
            "gosum",
            "gowork",
            "html",
            "http",
            "json",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "nix",
            "odin",
            "powershell",
            "regex",
            "ron",
            "rust",
            "sql",
            "templ",
            "terraform",
            "toml",
            "typescript",
            "vimdoc",
            "yaml",
            "typescript",
            "angular",
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
