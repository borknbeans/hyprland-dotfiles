return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        ts.setup {
            install_dir = vim.fn.stdpath("data") .. "/site"
        }

        local parsers = {
            "lua", "luadoc", "vim", "vimdoc", "query",
            "python", "bash", "json", "yaml", "toml",
            "markdown", "markdown_inline",
        }

        ts.install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local ok = pcall(vim.treesitter.start, args.buf)
                if ok then
                    vim.wo.foldmethod = "expr"
                    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                end
            end,
        })
    end,
}
