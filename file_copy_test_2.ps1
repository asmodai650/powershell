# original working code
## Copy-Item -Path '\\nas05060pn\homedirs_tn041\dcurtis1\powershell_test\cob_all_2495\text_file\PRS COB ALL.txt' -Destination '\\nas05060pn\homedirs_tn041\dcurtis1\powershell_test\cob_all_2495\'

# Test Code
$source = 'C:\Users\dcurtis1\Desktop\powershell_test\cob_all_2495\text_file\'
$sourcefiles = 'C:\Users\dcurtis1\Desktop\powershell_test\cob_all_2495\text_file\*'
$sourcefile1 = @("PRS COB All.txt")
$sourcefile2 = @("Copy of Amerigroup Invoiced Report.xlsx")
$dest = 'C:\Users\dcurtis1\Desktop\powershell_test\cob_all_2495\'
$destfiles = Get-ChildItem -recurse $dest -file
$logProgress = 'C:\Users\dcurtis1\Desktop\powershell_test\Copylog.txt'


if(Test-Path "$dest\$sourcefiles")
        {
        echo "ERROR: $('[{0:MM/dd/yy} {0:HH:mm:ss}]' -f (Get-Date)) $sourcefile1 already exists in $dest" | out-file -append $logProgress
        }
    else 
        {
        Copy-Item -Path "$sourcefiles" -Destination $dest -Exclude $destfiles #-errorAction silentlyContinue
        echo "$('[{0:MM/dd/yy} {0:HH:mm:ss}]' -f (Get-Date)) $sourcefile1 copied to $dest" | out-file -append $logProgress
        }

if(Test-Path "$dest\$sourcefiles")
        {
        echo "ERROR: $('[{0:MM/dd/yy} {0:HH:mm:ss}]' -f (Get-Date)) $sourcefile2 already exists in $dest" | out-file -append $logProgress
        }
    else 
        {
        Copy-Item -Path "$source\$sourcefile2" -Destination $dest -Exclude $destfiles #-errorAction silentlyContinue
        echo "$('[{0:MM/dd/yy} {0:HH:mm:ss}]' -f (Get-Date)) $sourcefile2 copied to $dest" | out-file -append $logProgress
        }