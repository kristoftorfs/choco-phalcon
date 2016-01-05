$ini = [io.path]::Combine($(Get-BinRoot), 'php', 'php.ini')
(Get-Content $ini) | Foreach-Object {
$_ -replace 'extension=php_phalcon.dll', ''
} | Set-Content $ini
$dll = [io.path]::Combine($(Get-BinRoot), 'php', 'ext', 'php_phalcon.dll')
$lic = [io.path]::Combine($(Get-BinRoot), 'php', 'ext', 'LICENSE.txt')
Remove-Item -Force $dll
Remove-Item -Force $lic