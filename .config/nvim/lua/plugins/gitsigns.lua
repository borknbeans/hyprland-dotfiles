return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gs = require("gitsigns")
        gs.setup {
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 1000,
                ignore_whitespace = true,
                virt_text_priority = 100,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        }

        vim.keymap.set("n", "<leader>gb", gs.blame_line, { desc = "Git blame popup"})
   end,
}
