$NodeDir = "$PSScriptRoot\frontend-tools\node"
$env:Path = "$NodeDir;" + $env:Path
& "$NodeDir\npm.cmd" run dev
