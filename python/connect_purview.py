python/connect_purview.py
"""
connect_purview.py
Simple MSAL client credential helper to obtain tokens for Graph and Purview.
pip install msal requests
"""

import os
import msal
import requests

TENANT_ID = os.getenv("AZ_TENANT_ID")
CLIENT_ID = os.getenv("AZ_CLIENT_ID")
CLIENT_SECRET = os.getenv("AZ_CLIENT_SECRET")

def get_token(scope="https://graph.microsoft.com/.default"):
    app = msal.ConfidentialClientApplication(
        CLIENT_ID, authority=f"https://login.microsoftonline.com/{TENANT_ID}", client_credential=CLIENT_SECRET
    )
    result = app.acquire_token_for_client(scopes=[scope])
    if "access_token" not in result:
        raise Exception("Failed to acquire token: " + str(result))
    return result["access_token"]

def graph_get(path, params=None):
    token = get_token()
    url = f"https://graph.microsoft.com{path}"
    hdr = {"Authorization": f"Bearer {token}", "Content-Type": "application/json"}
    r = requests.get(url, headers=hdr, params=params)
    r.raise_for_status()
    return r.json()

def graph_post(path, payload):
    token = get_token()
    url = f"https://graph.microsoft.com{path}"
    hdr = {"Authorization": f"Bearer {token}", "Content-Type": "application/json"}
    r = requests.post(url, headers=hdr, json=payload)
    r.raise_for_status()
    return r.json()
