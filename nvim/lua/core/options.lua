vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
opt.shell = "zsh"

-- Set shell to PowerShell 7 if on Win32 or Win64
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    opt.shell = "pwsh -NoLogo"
    opt.shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
    opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    opt.shellquote = ""
    opt.shellxquote = ""
end
-- Highlight when yanking (copying) text
--  Try it with yap in normal mode
--  See :help vim.highlight.on_yank()
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text", -- Description of the autocommand
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }), -- Group to prevent duplicate autocommands
    callback = function()
        vim.highlight.on_yank() -- Function that highlights the text after yanking
    end,
})
-- UI/General
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.cursorline = true
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.confirm = true
opt.mouse = "a"
opt.undofile = true
opt.swapfile = false
opt.conceallevel = 1
opt.scrolloff = 12
opt.wrap = true
opt.linebreak = true
opt.spelllang = "en_nz"
opt.showtabline = 0

-- Set statusline
opt.laststatus = 3
opt.statusline = require("core.statusline").statusline

-- Set tab width
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true
opt.breakindentopt = "shift:2"
opt.showbreak = "↳"

-- Make cursor blink
opt.guicursor = {
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50",
    "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
    "sm:block-blinkwait175-blinkoff150-blinkon175",
}
