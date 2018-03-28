# Change your EC Token here
$token = '49CB0FF2-C685-4277-B744-6550516175CF'

# Disable SSL Validation
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}

# Create a dictionary object to contain the HTTP headers
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"

# Create an HTTP Authorization header with the EC Token
$headers.Add("Authorization", 'Splunk ' + $token)

# Create the JSON data that will be sent along with the POST request
$event = @{
    event="demo event 1"
}
$json = $event | ConvertTo-Json

# Initiate the POST request including the headers and the JSON payload
$response = Invoke-RestMethod 'http://localhost:8088/services/collector' -Method Post -Body $json -ContentType 'application/json' -Headers $headers

# Echo the response
Write-Host $response