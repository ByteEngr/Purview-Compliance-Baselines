"""
deploy_sensitivity_label.py
Example: create label from a JSON file using Graph
"""

import json
import sys
from connect_purview import graph_post

if len(sys.argv) < 2:
    print("Usage: python deploy_sensitivity_label.py <label_template.json>")
    sys.exit(1)

template = sys.argv[1]
with open(template, "r", encoding="utf-8") as f:
    payload = json.load(f)

# endpoint for labels
path = "/v1.0/informationProtection/policy/labels"
resp = graph_post(path, payload)
print("Created label:", resp.get("id"))
