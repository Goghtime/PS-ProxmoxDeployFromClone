param (
    $Node,
    $VMID,
    $NodeFQDN,
    $PVEAuthCookie,
    $CSRFPreventionToken,
    $memory,
    $sockets,
    $ipconfig0,
    $net1,
    $ipconfig1
)

$uri = "https://$NodeFQDN`:8006/api2/json/nodes/$node/qemu/$vmid/config"

# Define headers
$headers = @{
    "Cookie" = "PVEAuthCookie=$PVEAuthCookie"
    "CSRFPreventionToken" = "$CSRFPreventionToken"
}

# Prepare the body
$body = @{
    "memory" = $memory
    "sockets" = $sockets
}

# Check if net1 and ipconfig1 are not null or empty and add them to the body
if ($net1 -ne $null -and $net1 -ne "") {
    $body["net1"] = $net1
}

if ($ipconfig1 -ne $null -and $ipconfig1 -ne "") {
    $body["ipconfig1"] = $ipconfig1
}

# Convert the body to JSON
$bodyJson = $body | ConvertTo-Json

# Send the request
$response = Invoke-RestMethod -Uri $uri -Method Post -Headers $headers -Body $bodyJson -ContentType "application/json" -SkipCertificateCheck

$response
