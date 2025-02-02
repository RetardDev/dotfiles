local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer' 
  use 'hrsh7th/cmp-path' 
  use 'hrsh7th/cmp-cmdline' 
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' 
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {{'nvim-lua/plenary.nvim'}}
    }
  use {
    'puremourning/vimspector',
    cmd = {"VimspectorInstall", "VimspectorUpdate"},
    fn = {"vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue"},
    config = function()
      require("config.vimspector").setup()
    end,
  }
  
 if packer_bootstrap then
    require('packer').sync()
  end
end)
