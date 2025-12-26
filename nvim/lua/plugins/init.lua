return {
  "tpope/vim-sensible",
  { 'alexghergh/nvim-tmux-navigation', config = function()
      require'nvim-tmux-navigation'.setup {
          disable_when_zoomed = true, -- defaults to false
          keybindings = {
              left = "<C-h>",
              down = "<C-j>",
              up = "<C-k>",
              right = "<C-l>",
              last_active = "<C-\\>",
              next = "<C-Space>",
          }
      }
  end
  },
  "preservim/nerdtree",
  {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
     dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "nvim-mini/mini.icons" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostics disable: missing-fields
    opts = {"fzf-vim"}
    ---@diagnostics enable: missing-fields
  },
  'numToStr/Comment.nvim',
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
}

