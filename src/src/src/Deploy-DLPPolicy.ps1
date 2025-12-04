<#
.SYNOPSIS
  Deploy a DLP policy template. This sample demonstrates a pattern — your tenant might require Compliance Center or Exchange endpoints.
#>

param(
    [Parameter(Mandatory)][string]$DlpJsonPath
)

. "$PSScriptRoot\Connect-Purview.ps1"

if (-not (Test-Path $DlpJsonPath)) { throw "DLP JSON not found: $DlpJsonPath" }

$body = Get-Content -Raw -Path $DlpJsonPath

# NOTE: There is not a single Graph v1.0 endpoint for all DLP actions; many customers use Compliance Center API.
# Example placeholder: upload into a tenant-specific compliance endpoint or use Exchange Online cmdlets for transport rules.
$uri = "https://graph.microsoft.com/beta/security/dlppolicies"  # placeholder; validate for your tenant

Write-Host "Deploying DLP policy..." -ForegroundColor Cyan

try {
    $resp = Invoke-MgGraphRequest -Method POST -Uri $uri -Body $body -ContentType "application/json"
    Write-Host "DLP policy created (id): $($resp.id)" -ForegroundColor Green
}
catch {
    Write-Host "Failed to deploy DLP: $($_.Exception.Message)" -ForegroundColor Red
    throw
}
