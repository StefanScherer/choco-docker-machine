$packageName    = 'docker-machine'
$url            = 'https://github.com/docker/machine/releases/download/v0.4.1/docker-machine_windows-386.exe'
$checksum       = '2c0a9db7526a1f714c3d93c2368fffb9'
$url64          = 'https://github.com/docker/machine/releases/download/v0.4.1/docker-machine_windows-amd64.exe'
$checksum64     = '1f0ee1b4bf1f6fb170bb55f475843cd9'
$checksumType   = 'md5'
$checksumType64 = 'md5'
$validExitCodes = @(0)

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageDir  = "$(Split-Path -parent $toolsDir)"
$installDir  = Join-Path "$packageDir" "bin"
$installBin  = "${packageName}.exe"
$installPath = Join-Path "$installDir" "$installBin"

New-Item -ItemType Directory -Force -Path "$installDir"
Get-ChocolateyWebFile "$packageName" "$installPath" "$url" "$url64" -checksum "$checksum" -checksumType "$checksumType" -checksum64 "$checksum64" -checksumType64 "$checksumType64"
