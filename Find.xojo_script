//
// Simple "Find" command for the current editor.
//
// Differs from IDE's Find system in that it immediately moves
// the cursor through the found matches. Use the companion
// "Find Next" script cycle through all matches in the IDE.
//
// Author: Jeremy Cowgar <jeremy@cowgar.com>
//

const kFilename = "~/.cowgar-xojo-find"

//
// Utility Methods
//

sub WriteFile(filename as String, content as String)
content = ReplaceAll(content, """", "\""")

call DoShellCommand("printf """ + content + """ > " + filename)
end sub

//
// Find Code
//

dim cursorPosition as Integer = SelStart
dim find as String = Input("Find what?")

if find.Trim = "" then
Beep
return
end if

dim pos as Integer = Instr(SelStart, Text, find)

if pos = 0 then
Beep
return
end if

SelStart = pos - 1
SelLength = find.Len

WriteFile("~/.cowgar-xojo-find", Str(pos) + "," + find)