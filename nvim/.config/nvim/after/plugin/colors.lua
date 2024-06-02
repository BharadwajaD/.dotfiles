function ColorIt(scheme)

    vim.cmd("colorscheme " .. scheme)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end


require("rose-pine").setup({
    disable_background = true,
})

ColorIt("rose-pine")
