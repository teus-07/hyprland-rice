-- Caminho para o Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configurando plugins diretamente
require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Garante que o tema seja carregado primeiro
    config = function()
      require("catppuccin").setup() -- Configuração adicional (opcional)
    end,
  },
  -- Outros plugins podem ser adicionados aqui, exemplo:
  -- { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
})

-- Aplicando o tema Catppuccin
vim.cmd.colorscheme("catppuccin")

