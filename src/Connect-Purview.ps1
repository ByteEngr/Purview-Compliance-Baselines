<#
.SYNOPSIS
  Authenticate to Microsoft Graph / Purview using OAuth2 Client Credentials or interactive flow.
.NOTES
  - Recommended: Use Managed Identity (Azure) or store client secrets in Key Vault.
  - Requires Microsoft.Graph PowerShell SDK: Install-Module Microsoft.Graph -Scope CurrentUser
#>

param(
    [string]$TenantId = "<YOUR_TENANT_ID>",
    [string]$ClientId = "<YOUR_CLIENT_ID>",
    [string]$ClientSecret = "<YOUR_CLIENT_SECRET>",
    [switch]$UseInteractive   # if set, use interactive auth for testing
)

function Validate-Module {
    if (-not (Get-Module -ListAvailable -Name Microsoft.Graph)) {
        Write-Host "Microsoft.Graph SDK not found. Installing..." -ForegroundColor Yellow
        Install-Module Microsoft.Graph -Scope CurrentUser -Force
    }
}

Validate-Module

if ($UseInteractive) {
    Write-Host "Connecting interactively to Microsoft Graph..." -ForegroundColor Cyan
    Connect-MgGraph -Scopes @(
        "User.Read",
        "InformationProtectionPolicy.ReadWrite.All",
        "InformationProtectionLabels.ReadWrite.All",
        "SecurityEvents.ReadWrite.All",
        "Compliance.ReadWrite.All",
        "Policy.ReadWrite.ConditionalAccess"
    )
} else {
    if ($ClientSecret -eq "<YOUR_CLIENT_SECRET>" -or $ClientId -eq "<YOUR_CLIENT_ID>") {
        throw "Provide ClientId and ClientSecret or use -UseInteractive for dev testing."
    }
    Write-Host "Connecting via client credentials..." -ForegroundColor Cyan
    Connect-MgGraph -ClientId $ClientId -TenantId $TenantId -ClientSecret $ClientSecret -Scopes @("https://graph.microsoft.com/.default")
}

# Verify connection
try {
    $who = Get-MgOrganization -ErrorAction Stop
    Write-Host "Connected to tenant: $($who.DisplayName)" -ForegroundColor Green
}
catch {
    Write-Host "Graph connection failed: $($_.Exception.Message)" -ForegroundColor Red
    throw
}
