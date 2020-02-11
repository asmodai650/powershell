#Move Justintime file from Ancillary to subfolder until ready to implement


if (!([system.io.file]::Exists("H:\powershell_test\folder_c\$([datetime]::now.ToString('yyyyMMdd'))_JUSTINTIMEINVESTIGATIONS_LOAD.txt.gz")))

    {
        robocopy "H:\powershell_test\folder_a\" "H:\powershell_test\folder_c\" "JUSTINTIMEINVESTIGATIONS_LOAD.txt.gz" /mov /r:3 /w:6 /log:H:\powershell_test\folder_c\justintime_copy_log.txt
       
        #Move-Item "H:\powershell_test\folder_a\JUSTINTIMEINVESTIGATIONS_LOAD.txt.gz" -Destination "H:\powershell_test\folder_c\$([datetime]::now.ToString('yyyyMMdd'))_JUSTINTIMEINVESTIGATIONS_LOAD.txt.gz"

        rename-item "H:\powershell_test\folder_c\JUSTINTIMEINVESTIGATIONS_LOAD.txt.gz" "H:\powershell_test\folder_c\$([datetime]::now.ToString('yyyyMMdd'))_JUSTINTIMEINVESTIGATIONS_LOAD.txt.gz"
    }

else
    {
        exit
    };