dim status as Integer
dim cmd as String
cmd = "cd $PROJECT_PATH && git difftool"

dim result as String
result = DoShellCommand(cmd, 3000, status)

if status <> 0 then
Print "Error: " + Str(status) + ": " + result
end if