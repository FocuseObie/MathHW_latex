" General Settings
set nocompatible              " Disable compatibility with vi
filetype plugin indent on     " Enable filetype detection, plugins, and indentation
syntax enable                 " Enable syntax highlighting
let g:vimtex_syntax_enabled = 1
" Set up the plugin manager (vim-plug)
call plug#begin('~/.local/share/nvim/plugged')

" vimtex plugin for LaTeX editing
Plug 'lervag/vimtex'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()

" ----------------------------------------------------------------------
" SNIPPET CONFIGURATION
" ----------------------------------------------------------------------
" Step 1: Tell Neovim's Lua interpreter where to find your custom modules.
lua << EOF
package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/lua/?.lua'
EOF

" Step 2: Use an autocommand to load the snippets after startup.
augroup LoadMySnippets
  autocmd!
  autocmd FileType tex lua require('luasnip').add_snippets('tex', require('custom-snippets.tex'))
augroup END
" ----------------------------------------------------------------------

" vimtex settings for LaTeX editing




let g:vimtex_view_method = 'zathura'     " Use Zathura for PDF viewing
let g:vimtex_compiler_method = 'latexmk'   " i

let g:vimtex_syntax_math_envs = extend(
      \ get(g:, 'vimtex_syntax_math_envs', []),
      \ ['enumerate', 'itemize', 'description']
      \ )

" Key mapping for compiling LaTeX (trigger xelatex)
autocmd FileType tex nnoremap <silent> <leader>ll :VimtexCompile<CR>

" Key mapping for opening the PDF in Zathura
autocmd FileType tex nnoremap <silent> <leader>lv :VimtexView<CR>

lua << EOF
package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/lua/?.lua'
EOF

" Use an autocommand to load the snippets for tex files.
augroup LoadMySnippets
  autocmd!
  autocmd FileType tex lua require('luasnip').add_snippets('tex', require('custom_snippets.tex'))
augroup END
" ----------------------------------------------------------------------


" Main Lua configuration for plugins
lua << EOF
-- Define GLOBAL helper functions for snippet conditions
-- This uses the function provided by the vimtex plugin.
_G.in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- Define the MISSING out_mathzone function
_G.out_mathzone = function()
  return not _G.in_mathzone()
end

-- Setup nvim-cmp
local cmp = require'cmp'
local luasnip = require'luasnip'

require('luasnip').setup({
  history = true,
})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip', priority = 10 },
    { name = 'buffer', priority = 5 },
  })
})

-- A smarter function that expands snippets AND inserts a space.
local smart_space = function()
  local luasnip = require('luasnip')

  if _G.in_mathzone() and luasnip.expandable() then
    -- If in a math zone and a snippet can be expanded, expand it.
    luasnip.expand()
  end

  -- ALWAYS insert a space, either after expanding or as the primary action.
  vim.api.nvim_feedkeys(' ', 'in', true)
end

-- Map <Space> in insert mode to our smart function (this line stays the same).
vim.keymap.set('i', '<Space>', smart_space, { silent = true })
EOF

