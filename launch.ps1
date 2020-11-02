Import-Module pode

# create a server, and start listening on port 8085
Start-PodeServer -Threads 2 {

    # listen on *:8085
    Add-PodeEndpoint -Address * -Port 8085 -Protocol Http

    # set view engine to pode renderer
    # Set-PodeViewEngine -Type Pode
    Add-PodeStaticRoute -Path '/' -source 'www' -Defaults @('index.html')

}