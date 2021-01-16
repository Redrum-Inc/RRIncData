
Remove-Item * -Recurse -Force -exclude *.ps1 

#git clone https://github.com/Redrum-Inc/RRIncData.git
Invoke-WebRequest https://github.com/Redrum-Inc/RRIncData/archive/main.zip -OutFile main.zip


Expand-Archive -LiteralPath .\main.zip -DestinationPath .\

If (Test-Path -Path .\RRIncData-main)
{
    Copy-Item -Path .\RRIncData-main\* -Destination .\ -Recurse
    Remove-Item .\RRIncData-main -Force -Recurse
    Remove-Item .\.gitignore -Force
    Remove-Item .\README.md -Force
    Remove-Item .\main.zip  -Force
} Else { Write-Host "Can't find files, something went wrong." }