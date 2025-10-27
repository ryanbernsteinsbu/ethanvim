return{
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
       require("bufferline").setup({
            options = {
                numbers = "buffer_id",
                diagnostics = "nvim_lsp",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        separator = true, -- shows a vertical line between Neo-tree and buffers
                    }
                },
                show_buffer_close_icons = false,
                show_close_icon = false,
                always_show_bufferline = false,
            }
        })
    end
}
