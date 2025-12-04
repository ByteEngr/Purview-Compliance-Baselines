<#
.SYNOPSIS
  Deploy an Information Protection sensitivity label from a JSON template.
.DESCRIPTION
  Uses Microsoft Graph Information Protection APIs (v1.0). Some advanced label features require admin-level APIs or Purview endpoints.
#>

param(
    [Parameter(Mandatory)][string]$TemplatePath
)

. "$PSScriptRoot\Connect-Purview.ps1"

if (-not (Test-Path $TemplatePath)) {
    throw "Template not found: $TemplatePath"
}

$body = Get-Content -Path $TemplatePath -Raw

# Graph endpoint for labels - v1.0 path for information protection
$uri = "https://graph.microsoft.com/v1.0/informationProtection/policy/labels"

Write-Host "Creating sensitivity label from template: $TemplatePath" -ForegroundColor Cyan

try {
    $resp = Invoke-MgGraphRequest -Method POST -Uri $uri -Body $body -ContentType "application/json"
    Write-Host "Label created. Response id: $($resp.id)" -ForegroundColor Green
} catch {
    Write-Host "Failed to create label: $($_.Exception.Message)" -ForegroundColor Red
    throw
}
