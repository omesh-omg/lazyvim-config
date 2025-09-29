return {
    "okuuva/auto-save.nvim",
    lazy = false,
    priority = 1000, -- Load early
    config = function()
        require("auto-save").setup({
            enabled = true,
            execution_message = {
                message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
                dim = 0.18,
                cleaning_interval = 1250,
            },
            trigger_events = {
                immediate_save = { "BufLeave", "FocusLost" },
            },
            debounce_delay = 2000,
            condition = function(buf)
                local fn = vim.fn
                if
                    fn.getbufvar(buf, "&modifiable") == 1
                    and fn.getbufvar(buf, "&readonly") == 0
                    and fn.expand("%") ~= ""
                    and fn.getbufvar(buf, "&buftype") == ""
                then
                    return true
                end
                return false
            end,
        })
    end,
}
