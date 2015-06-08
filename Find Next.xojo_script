//
// Simple "Find Next" command for the current editor.
//
// Differs from IDE's Find system in that it immediately moves
// the cursor through the found matches. Use the companion
// "Find" script to perform the first find.
//
// Author: Jeremy Cowgar <jeremy@cowgar.com>
//

const kStateFilename = "~/.cowgar-xojo-find"

//
// Utility Methods
//

sub WriteFile(filename as String, content as String)
content = ReplaceAll(content, """", "\""")

call DoShellCommand("printf """ + content + """ > " + filename)
end sub

function ReadFile(filename as String) as String
return DoShellCommand("cat " + filename)
end function

function ReadFindData(byref startPosition as Integer, byref find as String) as Boolean
dim content as String = ReadFile(kStateFilename).Trim

if content = "" or InStr(content,",") = 0 then
return false
end if

startPosition = Val(NthField(content, ",", 1))
find = NthField(content, ",", 2).Trim

return (find <> "")
end function

//
// Find Next
//

dim cursorPosition as Integer = SelStart
dim startPosition as Integer
dim find as String

if not ReadFindData(startPosition, find) then
Beep
return
end if

dim pos as Integer = Instr(startPosition + 1, Text, find)

WriteFile(kStateFilename, Str(pos) + "," + find)

if pos = 0 then
Beep
return
end if

SelStart = pos - 1
SelLength = find.Len