//
// Run a shell command in the terminal and activate the
// terminal when done
//

sub RunShellCommandInTerminal(cmd as String)
dim status as Integer
dim result as String

cmd = "osascript -e 'tell application ""Terminal"" to do script """ + cmd + """'"
result = DoShellCommand(cmd, 3000, status)

if status <> 0 then
Print "Error: " + Str(status) + ": " + result
else
cmd = "osascript -e 'tell application ""Terminal"" to activate'"
result = DoShellCommand(cmd)
end if
end sub

//
// Write `content` into the file `filename`
//

sub WriteFile(filename as String, content as String)
content = ReplaceAll(content, """", "\""")

call DoShellCommand("printf """ + content + """ > " + filename)
end sub

//
// Read the contents of `filename`
//

function ReadFile(filename as String) as String
return DoShellCommand("cat " + filename)
end function