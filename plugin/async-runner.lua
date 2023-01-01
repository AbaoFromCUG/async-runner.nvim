local function complete(arg, cmd_line)
    local matches = { "Hello", "World" }
    print(vim.inspect(arg))
    print(vim.inspect(cmd_line))
    return matches
end

vim.api.nvim_create_user_command("Task", require("async-runner").run_task, { nargs = "*", complete = complete })
