Title: Rollback policy or label
Purpose: Remove or disable a policy/label (safe rollback steps)

Steps:
1) Backup the current policy/label JSON (GET -> save file)
2) Disable policy first before deleting:
   PATCH https://graph.microsoft.com/beta/security/dlppolicies/<id> { "isEnabled": false }
3) Wait 24-72 hours for telemetry; verify incidents stop creating
4) Delete resource if required:
   DELETE https://graph.microsoft.com/v1.0/informationProtection/policy/labels/<id>

Verification:
- Policy status is Disabled
- No further incidents triggered by previous test documents
