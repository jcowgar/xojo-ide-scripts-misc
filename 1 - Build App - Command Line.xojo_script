Dim projectToOpen As String = Clipboard

OpenFile(projectToOpen)

DoCommand "BuildApp"
DoCommand "CloseWindow"
