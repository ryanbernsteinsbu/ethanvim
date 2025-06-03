return{
    "ibhagwan/fzf-lua",
    dependencies = {"nvim-tree/nvim-web-devicons", { "junegunn/fzf", build = "./install --bin" } },
    config = function()
        local fzf = require("fzf-lua")
        fzf.setup({})

         local keymap = vim.keymap
         keymap.set("n", "<leader>pf","<cmd>FzfLua files<CR>" , { desc = "Project find file" })
         keymap.set("n", "<leader>pr", "<cmd>FzfLua live_grep_native<CR>", { desc = "Project grep" })
         keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { desc = "Manage buffers" })
    end
}
