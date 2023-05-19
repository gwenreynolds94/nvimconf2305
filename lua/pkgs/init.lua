local P = {}

local autopacker = require'pkgs.auto-packer'

autopacker:init{
    {
        [[Shatur/neovim-session-manager]],
        requires = {{[[nvim-lua/plenary.nvim]]}}
    },
    {
        [[nvim-lualine/lualine.nvim]],
        requires = {[[nvim-tree/nvim-web-devicons]], opt = true}
    },
    {
        [[nvim-tree/nvim-tree]],
        requires = {[[nvim-tree/nvim-web-devicons]]}
    },
    {
        [[neoclide/coc.nvim]],
        branch = [[release]]
    },
    { [[rcarriga/nvim-notify]] },
    { [[nvim-treesitter/nvim-treesitter]] },
    { [[EdenEast/nightfox.nvim]] },
    --- { [[neovim/nvim-lspconfig]] },
    { [[RRethy/nvim-align]] },
}

return P
