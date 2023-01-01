local commands = require("async-runner.commands")

describe("commands parse", function()
    it("register command", function()
        commands.register("test_command", function()
            return "result"
        end)
        assert.equal("result", commands.expand("${test_command}"))

        commands.register("command_with_arg", function(arg)
            return "result--" .. arg
        end)
        assert.equal("result--myarg", commands.expand("${command_with_arg:myarg}"))
    end)
end)
