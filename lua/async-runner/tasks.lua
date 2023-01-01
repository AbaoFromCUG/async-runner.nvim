local M = {}


local Task = {}

function Task:new()

end

M.Task = Task;

local tasks = {

}

function M.registerTaskProvider(name, handle)
    tasks[name] = handle
end

return M
