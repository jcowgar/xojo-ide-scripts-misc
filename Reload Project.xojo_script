//
// Simple Project Reloading
//
// Author: Jeremy Cowgar <jeremy@cowgar.com>
//

dim projectFile as string = ProjectShellPath
DoCommand("CloseWindow")
OpenFile(projectFile)