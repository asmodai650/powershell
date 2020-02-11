$files = Get-Content "H:\powershell_test\archive_delete_test\providerdeletelist.csv"
 
foreach ($file in $files) {
    Remove-Item -Path $file -force -Recurse -Verbose
    }
 
write-host -foregroundcolor yellow "Delete action complete"
