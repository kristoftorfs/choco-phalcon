$url = 'https://static.phalconphp.com/www/files/phalcon_x86_vc11_php5.6.0_2.0.9_nts.zip';
$url64 = 'https://static.phalconphp.com/www/files/phalcon_x64_vc11_php5.6.0_2.0.9_nts.zip';

$packageName = 'phalcon';
$targetFolder = [io.path]::Combine($(Get-BinRoot), 'php', 'ext')
$src = [io.path]::Combine($(Get-BinRoot), 'php', 'php.ini-development')
$ini = [io.path]::Combine($(Get-BinRoot), 'php', 'php.ini')
if (Test-Path $ini) {
    $src = $ini
}

(Get-Content $src) | Foreach-Object {
$_ -replace ';extension=php_curl.dll', 'extension=php_curl.dll' `
    -replace ';extension=php_mbstring.dll', 'extension=php_mbstring.dll' `
    -replace ';extension=php_openssl.dll', "extension=php_openssl.dll`r`nextension=php_phalcon.dll" `
    -replace '; extension_dir = "ext"', 'extension_dir = "ext"'
} | Set-Content $ini

Install-ChocolateyZipPackage "$packageName" "$url" "$targetFolder" "$url64"
Install-ChocolateyPath $targetFolder
echo ("Phalcon framework installed in " + $targetFolder)