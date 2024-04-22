$repo = "kee-org/keepassrpc"
$file_prefix = "KeePassRPC.plgx"
$file_suffix = ".plgx"
   
$releases = "https://api.github.com/repos/$repo/releases/latest"
   
Write-Host -NoNewline "Determining latest release... "
$download = ((Invoke-WebRequest $releases | ConvertFrom-Json)[0].assets | Where-Object -Property name -Match "$file_prefix" | Where-Object -Property name -Match "$file_suffix")[0].browser_download_url
$file = ((Invoke-WebRequest $releases | ConvertFrom-Json)[0].assets | Where-Object -Property name -Match "$file_prefix" | Where-Object -Property name -Match "$file_suffix")[0].name
 
Write-Host Downloading latest release from $download
Invoke-WebRequest $download -Out ${env:USERPROFILE}\Downloads\$file
   
Write-Host -NoNewline "Installing plugin... "
Move-Item -Force ${env:USERPROFILE}\Downloads\$file 'C:\Program Files\KeePass Password Safe 2\Plugins\'
Write-Host "Done."
Write-Host "You must restart KeePass to load the new plugin."
