import requests
import jwt
import time

KEY_ID = 'YOUR_KEY_ID'
ISSUER_ID = 'YOUR_ISSUER_ID'
PRIVATE_KEY = '''-----BEGIN PRIVATE KEY-----
YOUR_PRIVATE_KEY
-----END PRIVATE KEY-----'''

# Generate JWT token
def generate_token(key_id, issuer_id, private_key):
    headers = {
        'alg': 'ES256',
        'kid': key_id
    }
    payload = {
        'iss': issuer_id,
        'exp': int(time.time()) + 20 * 60,
        'aud': 'appstoreconnect-v1'
    }
    token = jwt.encode(payload, private_key, algorithm='ES256', headers=headers)
    return token

def download_sales_report(filter_params):
    token = generate_token(KEY_ID, ISSUER_ID, PRIVATE_KEY)
    headers = {
        'Authorization': f'Bearer {token}',
        'Accept': 'application/a-gzip'
    }
    url = 'https://api.appstoreconnect.apple.com/v1/salesReports'
    
    response = requests.get(url, headers=headers, params=filter_params)
    
    if response.status_code == 200:
        with open('sales_report.gz', 'wb') as f:
            f.write(response.content)
        print('Report downloaded successfully.')
    else:
        print(f'Failed to download report: {response.status_code} - {response.json()}')

if __name__ == "__main__":
    filter_params = {
        'filter[frequency]': 'MONTHLY',
        'filter[reportDate]': '2023-12',
        'filter[reportSubType]': 'SUMMARY',
        'filter[reportType]': 'SALES',
        'filter[vendorNumber]': 'YOUR_VENDOR_NUMBER',
        'filter[version]': '1_0'
    }
    
    download_sales_report(filter_params)