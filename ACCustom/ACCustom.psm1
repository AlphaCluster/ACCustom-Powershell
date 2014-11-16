<# 
 .Synopsis
  Lists all the entries in a hosts file.

 .Description
  Lists all the entries in a hosts file.

 .Example
   List-HostEntries
#>

function PrintHostsEntry{
param([string]$lineEntry)
    $splitLine = $lineEntry -split '[ \t]+'
    if ($lineEntry.Contains("#")){
        $description = $lineEntry.Substring($lineEntry.IndexOf("#")+1).Trim()
    }
    else{
        $description = ""
    }
    $entry = New-Object PSObject
    $entry | Add-Member NoteProperty IPAddress($splitLine[0])
    $entry | Add-Member NoteProperty HostName($splitLine[1])
    $entry | Add-Member NoteProperty Description($description)
    Write-Output $entry
}


function Get-HostsEntries{
$hosts = Join-Path $env:windir system32\drivers\etc\hosts

echo "Actual File"
cat $hosts

echo "Attempt parsing"
#echo "IP Address   HostName      Description"
#echo "----------------------------------------------------"
$content = Get-Content $hosts
foreach ($line in $content){
        # Make sure its not a blank or commented line!
        if (($line.Length -gt 0) -and ($line[0] -ne '#')) {
            Write-Output "Found this line" + $line
            PrintHostsEntry($line)
        }
    }
}

Export-ModuleMember -Function Get-HostsEntries