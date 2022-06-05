
<#
	Function to update sql data when the user scans barcode. 
	Scan barcode to add/remove inventory quantity by 1
	Update date and time everytime user scan to add/remove inventory
#>
function scanInventory
{	param([string]$barcodeValue)
	switch($barcodeValue)
	{
		"1"{
			#Add PC quantity +1
			Invoke-SqlUpdate -Query "UPDATE inventorytable
			SET Quantity = Quantity + 1, Date = now()
			Where Id = 1;
			"
		}
		"2"{
			#Remove PC quantity -1
			Invoke-SqlUpdate -Query "UPDATE inventorytable
			SET Quantity = Quantity - 1, Date = now()
			Where Id = 1;
			"
		}
		"3"{
			#Add Monitor quantity +1
			Invoke-SqlUpdate -Query "UPDATE inventorytable
			SET Quantity = Quantity + 1, Date = now()
			Where Id = 2;
			"
		}
		"4"{
			#Remove Monitor quantity -1
			Invoke-SqlUpdate -Query "UPDATE inventorytable
			SET Quantity = Quantity - 1, Date = now()
			Where Id = 2;
			"
		}
		"5"{
			#Add Keyboard quantity +1
			Invoke-SqlUpdate -Query "UPDATE inventorytable
			SET Quantity = Quantity + 1, Date = now()
			Where Id = 3;
			"
		}
		"6"{
			#Remove Keyboard quantity -1
			Invoke-SqlUpdate -Query "UPDATE inventorytable
			SET Quantity = Quantity - 1, Date = now()
			Where Id = 3;
			"
		}
		"7"{
			#Add Mouse quantity +1
			Invoke-SqlUpdate -Query "UPDATE inventorytable
			SET Quantity = Quantity + 1, Date = now()
			Where Id = 4;
			"
		}
		"8"{
			#Remove Mouse quantity -1
			Invoke-SqlUpdate -Query "UPDATE inventorytable
			SET Quantity = Quantity - 1, Date = now()
			Where Id = 4;
			"
		}
		"9"{
			#Add Phone quantity +1
			Invoke-SqlUpdate -Query "UPDATE inventorytable
			SET Quantity = Quantity + 1, Date = now()
			Where Id = 5;
			"
		}
		"10"{
			#Remove Phone quantity -1
			Invoke-SqlUpdate -Query "UPDATE inventorytable
			SET Quantity = Quantity - 1, Date = now()
			Where Id = 5;
			"
		}

	}


}


Import-Module SimplySql
Open-MySQLConnection -Server "localhost" -Port "3306" -Credential "root" -Database "inventory"
while($barcodeValue -ne -1)
{
Clear-Host	
Write-Host "
 _____                     _                    
|_   _|                   | |                   
  | | _ ____   _____ _ __ | |_ ___  _ __ _   _  
  | || '_ \ \ / / _ \ '_ \| __/ _ \| '__| | | | 
 _| || | | \ V /  __/ | | | || (_) | |  | |_| | 
 \___/_| |_|\_/ \___|_| |_|\__\___/|_|   \__, | 
                                          __/ | 
                                         |___/  
"
Invoke-SqlQuery -Query "select * from inventorytable" | Format-Table
$barcodeValue = Read-Host "Scan a barcode (-1 to quit)"
scanInventory($barcodeValue)
}

