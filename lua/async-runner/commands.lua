local M = {}


local commands = {
    file = function(_)
        return vim.fn.expand("%:p")
    end,
    fileBasename = function(_)
        return vim.fn.expand("%:t")
    end,
    fileBasenameNoExtension = function(_)
        return vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")
    end,
    fileDirname = function(_)
        return vim.fn.expand("%:p:h")
    end,
    fileExtname = function(_)
        return vim.fn.expand("%:e")
    end,
    relativeFile = function(_)
        return vim.fn.expand("%:.")
    end,
    relativeFileDirname = function(_)
        return vim.fn.fnamemodify(vim.fn.expand("%:.:h"), ":r")
    end,
    workspaceFolder = function(_)
        return vim.fn.getcwd()
    end,
    workspaceFolderBasename = function(_)
        return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    end,
    env = function(name)
        return os.getenv(name) or ''
    end,
}

function M.register(name, handle)
    commands[name] = handle
end

M.expand = function(content)
    local result = content:gsub("${(%a[%a%d:_]+)}", function(item)
        local parts = vim.fn.split(item, ":")
        if #parts == 1 then
            local p = commands[parts[1]]()
            return p
        elseif #parts == 2 then
            return commands[parts[1]](parts[2])
        end
        error("Unknow variable/command `" .. item .. "`")
    end)
    return result
end

return M
