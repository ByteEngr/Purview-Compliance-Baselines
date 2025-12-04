Title: Deploy classification pattern (SSN)
Purpose: Create a classification rule that tags documents containing SSNs

Prereq:
- Purview classification API access or Purview account
- Regex/Pattern validated to reduce false positives

Steps:
1) Prepare classification rule payload (pattern, confidence threshold)
2) POST to Purview classification endpoint:
   POST https://<your-purview-account>.purview.azure.com/classification/rules
   Body: templates/Classification-SSN-Pattern.json
3) Validate by scanning sample docs via Purview or using Graph content query to scan sample library

Verification:
- Purview classification shows matched documents
- Documents get flagged or labeled by automation
