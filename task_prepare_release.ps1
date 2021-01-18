$addonName = "RRIncData"

New-Item -ItemType Directory -Force -Path .\$addonName\
Copy-Item .\$addonName.lua -Destination .\$addonName\ 
Copy-Item .\$addonName.toc -Destination .\$addonName\ 

$version = ""

foreach($line in Get-Content .\$addonName\$addonName.toc) {
    if($line -match "## Version:"){
        $version = $line -replace "## Version: ", ""
        Write-Output "Found version: " $version
    }
}


$compress = @{
  Path = ".\"+$addonName+"\"
  CompressionLevel = "Fastest"
  DestinationPath = ".\"+$addonName+"-"+$version+"-classic.zip"
}
Compress-Archive @compress -Force

Remove-Item .\$addonName\ -Recurse -Force