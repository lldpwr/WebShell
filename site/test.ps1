test-path ./launch.ps1
<#
$job = Start-Job -ScriptBlock {./launch.ps1}
Start-Sleep 4s
$JobOutput =  $job | Receive-Job
Write-Host $JobOutput
Start-Sleep 1s
# hang here
$job | Stop-Job
$job | Remove-Job -Force
#>


