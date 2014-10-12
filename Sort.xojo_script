//
// Sort the editors content or selection, if any.
//
// Author: Jeremy Cowgar <jeremy@cowgar.com>
//

Dim workOn As String

If SelText <> "" Then
workOn = SelText
Else
workOn = Text
End If

Dim lines() As String = workOn.Split(EndOfLine)
lines.Sort

If SelText <> "" Then
SelText = Join(lines, EndOfLine)
Else
Text = Join(lines, EndOfLine)
End If