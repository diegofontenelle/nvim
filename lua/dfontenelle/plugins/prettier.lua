return {
    'MunifTanjim/prettier.nvim',
    dependencies = {
        'jose-elias-alvarez/null-ls.nvim',
        'neovim/nvim-lspconfig',
    },
    config = function()
        local prettier = require("prettier")

        prettier.setup({
            bin = 'prettierd', -- or `'prettierd'` (v0.23.3+)
            ["null-ls"] = {
                condition = function()
                    return prettier.config_exists({
                        -- if `false`, skips checking `package.json` for `"prettier"` key
                        check_package_json = true,
                    })
                end,
                runtime_condition = function(_)
                    -- return false to skip running prettier
                    return true
                end,
                timeout = 5000,
            },
            filetypes = {
                "css",
                "graphql",
                "html",
                "javascript",
                "javascriptreact",
                "json",
                "less",
                "markdown",
                "scss",
                "typescript",
                "typescriptreact",
                "yaml",
            },
        })
    end
}
