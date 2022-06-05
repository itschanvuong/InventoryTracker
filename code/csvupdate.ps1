<#
    Inventory script to update (add/remove) inventory quantity.
    User will choose option: add/remove, and what type of inventory they want to add/remove, and enter a quantity
    Current inventory: PC, Monitor, Keyboard, Mouse, Phone
    Data will be stored in a csv file
#>

function storeInventory {
    param([int]$menuOption)
    switch($menuOption)
    {
        <#Add inventory to the list#>
        1{
            #Add PC to the list
            $inventoryOption = Read-Host "Please choose: 1. PC -- 2. Monitor -- 3.Keyboard -- 4.Mouse -- 5.Phone"
            if($inventoryOption -eq 1)
            {
                $inventoryQuantity = Read-Host "Please Enter Quantity"
                [int]($inventoryData | Where-Object Name -eq "PC").Quantity += [int]($inventoryQuantity)
                $inventoryData | Export-Csv -Path $xl -NoTypeInformation

            }
            #Add Monitor to the list
            elseif($inventoryOption -eq 2)
            {
                $inventoryQuantity = Read-Host "Please Enter Quantity"
                [int]($inventoryData | Where-Object Name -eq "Monitor").Quantity += [int]($inventoryQuantity)
                $inventoryData | Export-Csv -Path $xl -NoTypeInformation

            }
            #Add Mouse to the list
            elseif($inventoryOption -eq 3)
            {
                $inventoryQuantity = Read-Host "Please Enter Quantity"
                [int]($inventoryData | Where-Object Name -eq "Mouse").Quantity += [int]($inventoryQuantity)
                $inventoryData | Export-Csv -Path $xl -NoTypeInformation

            }
            #Add Keyboard to the list
            elseif($inventoryOption -eq 4)
            {
                $inventoryQuantity = Read-Host "Please Enter Quantity"
                [int]($inventoryData | Where-Object Name -eq "Keyboard").Quantity += [int]($inventoryQuantity)
                $inventoryData | Export-Csv -Path $xl -NoTypeInformation

            }  
            #Add Phone to the List
            elseif($inventoryOption -eq 5)
            {
                $inventoryQuantity = Read-Host "Please Enter Quantity"
                [int]($inventoryData | Where-Object Name -eq "Phone").Quantity += [int]($inventoryQuantity)
                $inventoryData | Export-Csv -Path $xl -NoTypeInformation

            } 

        }
        <#Remove inventory from the list#>
        2
        {
            #Remove PC from the list
            $inventoryOption = Read-Host "Please Choose: 1. PC -- 2. Monitor -- 3.Keyboard -- 4.Mouse -- 5.Phone"
            if($inventoryOption -eq 1)
            {
                $inventoryQuantity = Read-Host "Please Enter Quantity"
                [int]($inventoryData | Where-Object Name -eq "PC").Quantity -= [int]($inventoryQuantity)
                $inventoryData | Export-Csv -Path $xl -NoTypeInformation

            }
            #Remove Monitor from the list
            elseif($inventoryOption -eq 2)
            {
                $inventoryQuantity = Read-Host "Please Enter Quantity"
                [int]($inventoryData | Where-Object Name -eq "Monitor").Quantity -= [int]($inventoryQuantity)
                $inventoryData | Export-Csv -Path $xl -NoTypeInformation

            }
            #Remove Mouse from the list
            elseif($inventoryOption -eq 3)
            {
                $inventoryQuantity = Read-Host "Please Enter Quantity"
                [int]($inventoryData | Where-Object Name -eq "Mouse").Quantity -= [int]($inventoryQuantity)
                $inventoryData | Export-Csv -Path $xl -NoTypeInformation

            }
            #Remove Keyboard to the list
            elseif($inventoryOption -eq 4)
            {
                $inventoryQuantity = Read-Host "Please Enter Quantity"
                [int]($inventoryData | Where-Object Name -eq "Keyboard").Quantity -= [int]($inventoryQuantity)
                $inventoryData | Export-Csv -Path $xl -NoTypeInformation

            }
            #Remove Phone from the List
            elseif($inventoryOption -eq 5)
            {
                $inventoryQuantity = Read-Host "Please Enter Quantity"
                [int]($inventoryData | Where-Object Name -eq "Phone").Quantity -= [int]($inventoryQuantity)
                $inventoryData | Export-Csv -Path $xl -NoTypeInformation

            } 

        }
        3
        {
            Stop-Process -Id $PID
        }
    


    }
}
$xl = "/home/not-root/Documents/code/inventory.csv"
$inventoryData = Import-CSV -Path $xl

while($menuOption -ne 3){
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
$menuOption = Read-Host "
1. Add
2. Remove
3. Exit
Please Enter an Option"
storeInventory($menuOption)
Clear-Host

}