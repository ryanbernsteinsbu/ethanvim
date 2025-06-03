return{
    {
        "L3MON4D3/LuaSnip",
        event = { "InsertEnter", "CmdlineEnter" },
        version = "v2.*",
        build = "make install_jsregexp",
        opts = {
            enable_autosnippets = true,
        },
        config = function()
            require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
            --require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
}
