<#
.Utility functions used across scripts
#>

function Ensure-Folder {
    param([Parameter(Mandatory)][string]$Path)
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -ItemType Directory -Force | Out-Null
    }
}

function Get-GraphToken {
    # Return current Graph access token if available (for REST calls outside SDK)
    try {
        $ctx = Get-MgContext -ErrorAction SilentlyContinue
        return $ctx.AccessToken
    } catch {
        return $null
    }
}
