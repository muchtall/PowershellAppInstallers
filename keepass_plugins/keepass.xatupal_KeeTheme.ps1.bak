$repo = "xatupal/KeeTheme"
$file_prefix = "KeeTheme"
$file_suffix = ".plgx"
$file_suffix2 = ".dll"
   
$releases = "https://api.github.com/repos/$repo/releases/latest"
   
Write-Host -NoNewline "Determining latest release... "
$download = ((Invoke-WebRequest $releases | ConvertFrom-Json)[0].assets | Where-Object -Property name -Match "$file_prefix" | Where-Object -Property name -Match "$file_suffix")[0].browser_download_url
$file = ((Invoke-WebRequest $releases | ConvertFrom-Json)[0].assets | Where-Object -Property name -Match "$file_prefix" | Where-Object -Property name -Match "$file_suffix")[0].name
$download2 = ((Invoke-WebRequest $releases | ConvertFrom-Json)[0].assets | Where-Object -Property name -Match "$file_prefix" | Where-Object -Property name -Match "$file_suffix2")[0].browser_download_url
$file2 = ((Invoke-WebRequest $releases | ConvertFrom-Json)[0].assets | Where-Object -Property name -Match "$file_prefix" | Where-Object -Property name -Match "$file_suffix2")[0].name
 
Write-Host Downloading latest release from $download
Invoke-WebRequest $download -Out ${env:USERPROFILE}\Downloads\$file
Invoke-WebRequest $download2 -Out ${env:USERPROFILE}\Downloads\$file2

Write-Host ""
Write-Host "You must stop KeePass before proceeding."
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');

Write-Host -NoNewline "Installing plugin... "
Move-Item -Force ${env:USERPROFILE}\Downloads\$file 'C:\Program Files\KeePass Password Safe 2\Plugins\'
Move-Item -Force ${env:USERPROFILE}\Downloads\$file2 'C:\Program Files\KeePass Password Safe 2\Plugins\'
Write-Host "Done."
Write-Host "You may now restart KeePass."
