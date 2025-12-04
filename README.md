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

---

## 💼 Consulting & Deployment Packages

This repository includes deployable automation and templates.  
If you need help implementing it in your environment, the following services are available:

| Package | Scope | Timeline | Price |
|--------|-------|----------|-------|
| **Essentials Setup** | Deploy 1 sensitivity label, 1 retention rule, and DLP policy using templates in this repo | 2–3 days | **$3,500** |
| **Standard Deployment** | Full discovery workshop, deployment of up to 5 labels + 3 retention rules + automated rollout | 7–10 days | **$9,500** |
| **Enterprise Program** | End-to-end governance, automation, evidence packs, reporting, training, and operational support | 3–5 weeks | **$22,000** |

📌 Optional Add-Ons:

- Additional DLP Rules → **$750 each**
- Classification Rule Development → **$1,250 each**
- SIEM/Ticketing Integration → **$2,000**
- Monthly Managed Support → **$2,500/month**

> Pricing is flexible depending on industry, geography, and compliance requirements.

