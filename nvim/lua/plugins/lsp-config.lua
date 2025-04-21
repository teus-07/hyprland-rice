return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pylsp" },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- Ir para definição
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

        -- Código de ação (ex: sugestões e correções)
        vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action, opts)

        -- Renomear símbolo
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        -- Navegar entre erros/diagnósticos
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      end

      -- Configurar servidores
      lspconfig.lua_ls.setup({ on_attach = on_attach })
      lspconfig.pylsp.setup({ on_attach = on_attach })
    end,
  },
}
