function RunShellCommandInTerminal(cmd as String) as Boolean
dim status as Integer
dim result as String

cmd = "osascript -e 'tell application ""Terminal"" to do script """ + cmd + """'"
result = DoShellCommand(cmd, 3000, status)

if status <> 0 then
Print "Error: " + Str(status) + ": " + result
return False
else
cmd = "osascript -e 'tell application ""Terminal"" to activate'"
result = DoShellCommand(cmd)
end if

return True
end function

function PathFromProjectShellPath(removeEscapeCharacters as Boolean) as String
dim parts() as String
dim result as String

result = ProjectShellPath
parts = result.Split("/")
parts.Remove(parts.UBound)

result = Join(parts, "/")

if removeEscapeCharacters then
result = ReplaceAll(result, "\", "")
end if

return result
end function

dim path as String
path = PathFromProjectShellPath(True)

Call RunShellCommandInTerminal("cd " + path + " && tig status")
