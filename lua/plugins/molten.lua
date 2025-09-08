return {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
        -- these are examples, not defaults. Please see the readme
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_output_win_max_height = 20
        vim.g.molten_virt_text_output = true
        vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>",
            { silent = true, desc = "Initialize the plugin" })
        vim.keymap.set("n", "<leader><leader>r", ":MoltenEvaluateOperator<CR>",
            { silent = true, desc = "run operator selection" })
        vim.keymap.set("n", "<leader><leader>l", ":MoltenEvaluateLine<CR>",
            { silent = true, desc = "evaluate line" })
        vim.keymap.set("n", "<leader>l", ":MoltenReevaluateCell<CR>",
            { silent = true, desc = "re-evaluate cell" })
        vim.keymap.set("v", "<leader><leader>l", ":<C-u>MoltenEvaluateVisual<CR>gv",
            { silent = true, desc = "evaluate visual selection" })
    end,
}
