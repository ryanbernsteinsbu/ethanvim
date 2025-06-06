return{
    'dnlhc/glance.nvim',
    cmd = 'Glance',
    lazy = false,
    config = function()
        vim.keymap.set('n', 'gd', '<CMD>Glance definitions<CR>')
        vim.keymap.set('n', 'gr', '<CMD>Glance references<CR>')
        vim.keymap.set('n', 'gy', '<CMD>Glance type_definitions<CR>')
        vim.keymap.set('n', 'gI', '<CMD>Glance implementations<CR>')
    end
}
