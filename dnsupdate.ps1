$APIKey = "<your API key>"
$ZoneName = "<your domain>"
$RecordName = "<your A record name>"
$proxied = $false


$IP=$(Invoke-WebRequest -Uri 'http://checkip.amazonaws.com' -UseBasicParsing).Content.Trim()

$headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer $APIKey"
}

# Get zone ID
$url = "https://api.cloudflare.com/client/v4/zones?name=$ZoneName"
$response = Invoke-RestMethod -Method GET -Uri $url -Headers $headers
$zoneID = $response.result.id

# Get record ID
$url = "https://api.cloudflare.com/client/v4/zones/$zoneID/dns_records?type=A&name=$RecordName"
$response = Invoke-RestMethod -Method GET -Uri $url -Headers $headers
$recordID = $response.result.id

# Update record with new IP
$data = @{
    "type" = "A"
    "name" = "$RecordName"
    "content" = "$IP"
    "ttl" = 120
    "proxied" = $proxied
} | ConvertTo-Json

$url = "https://api.cloudflare.com/client/v4/zones/$zoneID/dns_records/$recordID"
$response = Invoke-RestMethod -Method PUT -Uri $url -Headers $headers -Body $data

Write-Host "Record updated successfully. New IP address: $IP"
