-- https://github.com/Pocco81/AutoSave.nvim
local status_ok, autosave = pcall(require, "autosave")
if not status_ok then
    vim.notify("autosave not found!")
    return
end

autosave.setup(
    {
        enabled = false,
        -- execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        execution_message = "",
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {"plugins.lua"},
            filetype_is_not = {"lua"},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
