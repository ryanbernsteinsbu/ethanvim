return{
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    --dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
        require("oil").setup({
            columns = {
                "icon",
                --"permissions",
                -- "size",
                -- "mtime",
            },
            keymaps = {
                 ["<leader>o"] = { ":q<CR>", desc = "Close Oil", mode = "n" },
                 ["<CR>"] = { "actions.select", opts = { vertical = true } },
            },
            show_hidden = true,
        })
        vim.keymap.set("n","<leader>o",":vert topleft 30vnew | Oil<CR>", { noremap = true, silent = true })
    end 
}
