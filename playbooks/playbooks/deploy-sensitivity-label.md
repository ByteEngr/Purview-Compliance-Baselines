Title: Deploy Sensitivity Label
Purpose: Create a new sensitivity label and publish to scope

Prereq:
- App with InformationProtectionPolicy.ReadWrite.All or interactive global admin
- Graph token (client credentials)

Steps:
1) Validate connectivity
   GET https://graph.microsoft.com/v1.0/organization
2) Create label
   POST https://graph.microsoft.com/v1.0/informationProtection/policy/labels
   Body: templates/Sensitivity-Confidential.json
3) Verify label exists
   GET https://graph.microsoft.com/v1.0/informationProtection/policy/labels
   -> confirm label.displayName == "Confidential - Company"
4) (Optional) Publish label to policy (label publishing flow uses policy endpoints)
   POST https://graph.microsoft.com/v1.0/informationProtection/policy/publish
   Body: { "labelIds": ["<label-id>"], "scope": { ... } }

Verification:
- Label visible in Compliance center > Information protection
- Sample document labeled using Graph or UI
