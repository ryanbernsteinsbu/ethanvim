return{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("lualine").setup({
            options = {
                theme = "nord",
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = { 'neo-tree' },  -- hide the whole statusline
                    winbar = {},                  -- optional: could also disable for winbar if used
                },
            }
        })
    end
}
