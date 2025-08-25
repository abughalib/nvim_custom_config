#lua-language-server0
-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
-- <start> CSharp OmniSharp Configuration
local pid = vim.fn.getpid()
local omnisharp_bin = "C:\\Binary\\omnisharp-win-x64\\OmniSharp.exe"

require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
}
-- <end> CSharp OmniSharp Configuration
require("lspconfig").rust_analyzer.setup{}
require("lspconfig").ts_ls.setup{}
require("lspconfig").tailwindcss.setup{}
require("lspconfig").html.setup{}
require("lspconfig").pylsp.setup{}
require("lspconfig").cmake.setup{}
require("lspconfig").clangd.setup{}
require("lspconfig").tailwindcss.setup{}
