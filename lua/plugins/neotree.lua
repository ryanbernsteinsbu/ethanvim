return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
        -- fill any relevant options here

    },
    config = function()
        require("neo-tree").setup({
            source_selector = {
                winbar = true,
                statusline = false
            },
            window = {
                width = 30,
                mappings = {
                    ["<leader>e"] = "close_window",
                }
            },
            default_component_configs = {
                indent = {
                    with_expanders = true, -- this is what enables expanders (triangles)
                    expander_collapsed = "▶",
                    expander_expanded = "▼",
                    expander_highlight = "NeoTreeExpander",
                },
            },
        })
        vim.keymap.set("n", "<leader>e", ":Neotree<CR>")
    end
}
