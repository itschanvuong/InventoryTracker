<#
    Inventory script using scanner to add/remove inventory quantity
    Data will be store in a csv file
    PC: Scan 1: Add ----- Scan 2: Remove
    Monitor: Scan 3: Add ----- Scan 4: Remove
    Mouse: Scan 5: Add ----- Scan 6: Remove
    Keyboard: Scan 7: Add ----- Scan 8: Remove
    Phone: Scan 9: Add ----- Scan 10: Remove

#>

function scan
{
    param([int]$scannerValue)
    switch($scannerValue)
    {
        1{
            #1. Add PC quantity if barcode scan 1
            [int]($inventoryData | Where-Object Name -eq "PC").Quantity += 1
            $inventoryData | Export-Csv -Path $xl -NoTypeInformation

        }

        2{  #2. Remove PC quantity if barcode scan 2
            [int]($inventoryData | Where-Object Name -eq "PC").Quantity -= 1 
            $inventoryData | Export-Csv -Path $xl -NoTypeInformation

        }

        3{  #3. Add Monitor quantity if barcode scan 3
            [int]($inventoryData | Where-Object Name -eq "Monitor").Quantity += 1
            $inventoryData | Export-Csv -Path $xl -NoTypeInformation

        }

        4{  #4. Remove Monitor quantity if barcode scan 4
            [int]($inventoryData | Where-Object Name -eq "Monitor").Quantity -= 1
            $inventoryData | Export-Csv -Path $xl -NoTypeInformation

        }
        
        5{  #5. Add Mouse quantity if barcode scan 5
            [int]($inventoryData | Where-Object Name -eq "Mouse").Quantity += 1
            $inventoryData | Export-Csv -Path $xl -NoTypeInformation

        }
        
        6{  #5. Remove Mouse quantity if barcode scan 6
            [int]($inventoryData | Where-Object Name -eq "Mouse").Quantity -= 1
            $inventoryData | Export-Csv -Path $xl -NoTypeInformation

        }

        7{  #5. Add Keyboard quantity if barcode scan 7
            [int]($inventoryData | Where-Object Name -eq "Keyboard").Quantity += 1
            $inventoryData | Export-Csv -Path $xl -NoTypeInformation

        }
        8{  #5. Remove Keyboard quantity if barcode scan 8
            [int]($inventoryData | Where-Object Name -eq "Keyboard").Quantity -= 1
            $inventoryData | Export-Csv -Path $xl -NoTypeInformation

        }
        9{  #5. Add Phone quantity if barcode scan 9
            [int]($inventoryData | Where-Object Name -eq "Phone").Quantity += 1
            $inventoryData | Export-Csv -Path $xl -NoTypeInformation

        }
        10{  #5. Remove Phone quantity if barcode scan 10
            [int]($inventoryData | Where-Object Name -eq "Phone").Quantity -= 1
            $inventoryData | Export-Csv -Path $xl -NoTypeInformation

        }



    }
    

}
$xl = "/home/not-root/Documents/code/inventory.csv"
$inventoryData = Import-CSV -Path $xl
while($scannerValue -ne -1){
Clear-Host
Write-Host 
" _____                     _                   
|_   _|                   | |                  
  | | _ ____   _____ _ __ | |_ ___  _ __ _   _ 
  | || '_ \ \ / / _ \ '_ \| __/ _ \| '__| | | |
 _| || | | \ V /  __/ | | | || (_) | |  | |_| |
 \___/_| |_|\_/ \___|_| |_|\__\___/|_|   \__, |
                                          __/ |
                                         |___/ 
"
$inventoryData | Format-Table -AutoSize
$scannerValue = Read-Host "Scan Barcode to Add/Remove inventory
-1 to Quit"
scan($scannerValue)
Clear-Host
}
Stop-Process -Id $PID