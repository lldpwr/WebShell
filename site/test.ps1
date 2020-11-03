$job = Start-Job -ScriptBlock {./launch.ps1}
Start-Sleep 1
$JobOutput =  $job | Receive-Job
Write-Host $JobOutput
Start-Sleep 1
$job | Stop-Job -Force
$job | Remove-Job -Force


