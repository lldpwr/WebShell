[CmdletBinding()]
param (
    $Port=8085
)
Import-Module pode
$env:ExternalPort=$Port

# create a server, and start listening on port 8085
Start-PodeServer -Threads 2 {
    # listen on *:8085
    Add-PodeEndpoint -Address * -Port $env:ExternalPort -Protocol Http

    # set view engine to pode renderer
    Set-PodeViewEngine -Type Pode
    Add-PodeStaticRoute -Path '/' -source (Join-Path $pwd.path -ChildPath www) -Defaults @('index.html')
}

