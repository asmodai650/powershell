
#Enter Directory you want to search
#$searchDir = "\\nas05060pn\homedirs_tn041\dcurtis1\TEMP_DESKTOP_ITEMS\New_folder"
#$searchDir = "\\apsep00312.aimhealth.com\data2\"
#$searchDir = "\\ibm-c2-b12.aimhealth.com\data\archive\dc"
$searchDir = "\\ibm-c2-b06.aimhealth.com\data1\intake\"
 
#This is what file or file type(s) you're searching for
#$searchfile = '*.txt$'

#Use this filter to include file types
$includelist = @("FilesiteOff_*")

#Use this filter to exclude file types
#$excludelist = @("*.gz", "*.7z", "*.gzip", "*.log", "logFile.txt", "logSortFile.txt", "logBcpFile.txt", "logBcpErrorFile.txt", "logFile.txt.bcperrors", "LogCountFile.txt","epctmp.log", "epc.log", "epc.chk", "AetnaTradRCE10LookupFile.txt")

#Location of your logfile of the results and the filename
$outputDir = "\\nas05060pn\homedirs_tn041\dcurtis1\TEMP_DESKTOP_ITEMS\Results\files_$(get-date -f yyyy-MM-dd).csv"

#Output sort Variables
$outputSource = @("Fullname", "Gigabytes")

#Variable for GetChildItem command 
$files = Get-ChildItem -Path $searchDir -include $includelist -Recurse -File | Where-Object {$_.PSParentPath -notmatch "Program Files|Users|Windows" -and $_.length -ge 1} -EA silentlyContinue | 
    Select Fullname, Basename, Extension, @{Name="GigaBytes"; Expression={"{0:F3}" -f ($_.Length / 1GB)}}, CreationTime, LastAccessTime | 
    Sort-Object $outputSource -Descending
 
#The results output to a CSV file; Append will add to the existing file, currently commented out
#$files | Export-Csv $outputDir #-Append

#The results output to a Pipe Delimited file; Append will add to the existing file, currently commented out
$files | Export-Csv -Delimiter '|' $outputDir #-Append

#Output to terminal 
write-host -foregroundcolor yellow "Search complete, opening list. Results can be viewed here: $outputDir"
 
#Start excel and open the logfile of the results
#Start-Process Excel -ArgumentList $outputDir

#Start UltraEdit and open the logfile of the results
UEdit32 -ArgumentList $outputDir
