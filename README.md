# Purview-Compliance-Baselines
Enterprise-ready Purview templates and automation to establish baseline compliance controls (sensitivity labels, retention, classification, DLP templates).
# Microsoft Purview Compliance Baselines

Enterprise baseline templates and automation for Microsoft Purview / Microsoft 365 compliance controls: sensitivity labels, retention, classification, and DLP templates.

## What this project contains
- Templates for sensitivity labels, retention labels, classification rules and a sample DLP policy
- PowerShell automation to deploy templates using service principal authentication
- Documentation and sample test artifacts

## Quick start
1. Clone repository.
2. Edit `src/Connect-Purview.ps1` with your service principal or use Managed Identity.
3. Run `.\src\Deploy-SensitivityLabel.ps1 -TemplateFilePath .\templates\Sensitivity-Confidential.json`
4. Validate in Microsoft Purview / Microsoft 365 Compliance center.

## Requirements
- PowerShell 7+
- Microsoft.Graph PowerShell SDK
- Service principal with delegated app permissions:
  - InformationProtectionPolicy.ReadWrite.All
  - SecurityEvents.ReadWrite.All
  - Compliance permissions as required
- Purview account for classification APIs (if used)

## Notes
- Test in a lab tenant before production.
- Store secrets in Azure Key Vault; do not hardcode credentials.

