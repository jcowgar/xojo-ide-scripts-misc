// Update application versioning information. Sets App.ShortVersion
// and also looks for a .git directory to set App.GetRevision for
// more versioning information in your application
//
// CAUTION: this script probably will not work on Windows without
// modification because of the shell command looking at the git
// regision number.

Dim s As String
s = Trim(DoShellCommand("cd ""$PROJECT_PATH"" && cat .git/refs/heads/master"))

If ConstantValue("App.GitRevision") <> s Then
Speak "Versioning Updated"
ConstantValue("App.GitRevision") = s

PropertyValue("App.ShortVersion") = PropertyValue("App.MajorVersion") + "." + _
PropertyValue("App.MinorVersion") + "." + PropertyValue("App.BugVersion")
PropertyValue("App.LongVersion") = PropertyValue("App.ProductName") + _
" v" + PropertyValue("App.ShortVersion") + _
" build " + PropertyValue("App.NonReleaseVersion") + _
". " + ConstantValue("App.Copyright")
End If