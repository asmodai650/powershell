##########################################################################################################################################################################

#Update this section as needed

$logProgress = 'C:\Users\dcurtis1\Desktop\powershell_test\Copylog.txt';

$srcdir = "C:\Users\dcurtis1\Desktop\powershell_test\cob_all_2495\text_file\";
$destdir = "C:\Users\dcurtis1\Desktop\powershell_test\cob_all_2495\";

$files = (Get-ChildItem $srcdir | where-object {-not ($_.PSIsContainer)});
#$files = (Get-ChildItem $srcdir -filter "PRS COB ALL.txt" | where-object {-not ($_.PSIsContainer)}); # add in filters for specific files (filter)
#$files = (Get-ChildItem $srcdir -recurse -filter "PRS COB ALL.txt" | where-object {-not ($_.PSIsContainer)}); # add in option to search through subfolders (recurse)

##########################################################################################################################################################################

#Unless additional variables are needed, no need to change any of the code below.

$files|foreach($_){
                    if (!([system.io.file]::Exists($destdir+$_.name)))
                        {
                            cp $_.Fullname ($destdir+$_.name)
                            echo "$('[{0:MM/dd/yy} {0:HH:mm:ss}]' -f (Get-Date)) SUCCESS: $_ copied to $destdir" | out-file -append $logProgress
                        }
    
                    else
                        {
                            echo "$('[{0:MM/dd/yy} {0:HH:mm:ss}]' -f (Get-Date)) ERROR: $_ already exists in $destdir" | out-file -append $logProgress
                        };
                   }