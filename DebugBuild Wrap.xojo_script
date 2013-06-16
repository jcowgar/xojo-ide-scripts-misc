'
' Wrap the selected text in a #If DebugBuild Then ... #EndIf statement
'
' Author: Jeremy Cowgar <jeremy@cowgar.com>
'

If SelLength = 0 Then
Call ShowDialog("No selection found", _
"DebugBuild Wrap requires that you first select the text you wish to wrap.", "OK")
Return
End If

Dim code As String
Dim final As String

code = Trim(SelText)
If code <> SelText Then
final = EndOfLine
End If

SelText = "#If DebugBuild Then" + EndOfLine + _
Trim(SelText) + EndOfLine + _
"#EndIf" + final