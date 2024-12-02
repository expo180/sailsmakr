import os
import base64
from google.oauth2.credentials import Credentials
from google.auth.transport.requests import Request
from googleapiclient.discovery import build
from dotenv import load_dotenv

# Load environment variables from the .env file
load_dotenv()

# Define the SCOPES for Gmail access
SCOPES = ['https://www.googleapis.com/auth/gmail.readonly']

def fetch_emails(provider='gmail', max_results=5, max_body_length=100):
    emails = []
    
    try:
        # Load OAuth2 credentials from environment variables
        creds = Credentials(
            None,
            refresh_token=os.getenv('GMAIL_REFRESH_TOKEN'),
            client_id=os.getenv('GMAIL_CLIENT_ID'),
            client_secret=os.getenv('GMAIL_CLIENT_SECRET'),
            token_uri=os.getenv('GOOGLE_TOKEN_URI'),
            scopes=SCOPES
        )

        # If credentials are expired, refresh them
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())

        # Use the Gmail API
        service = build('gmail', 'v1', credentials=creds)

        # Get the list of messages from the inbox
        results = service.users().messages().list(userId='me', maxResults=max_results).execute()
        messages = results.get('messages', [])

        for msg in messages:
            msg_data = service.users().messages().get(userId='me', id=msg['id']).execute()

            # Decode email subject and sender
            headers = msg_data['payload']['headers']
            subject = next(header['value'] for header in headers if header['name'] == 'Subject')
            sender = next(header['value'] for header in headers if header['name'] == 'From')
            
            # Get the email body
            parts = msg_data['payload'].get('parts', [])
            body = ""
            if parts:
                for part in parts:
                    if part['mimeType'] == 'text/plain':
                        body = base64.urlsafe_b64decode(part['body']['data']).decode('utf-8')
                        break  # Get the first text/plain part

            # Truncate the email body to the specified max length
            if len(body) > max_body_length:
                body = body[:max_body_length] + '...'

            emails.append({
                'sender': sender,
                'subject': subject,
                'body': body,  # Truncated body for list view
                'full_body': body,  # Store the full body for modal view
                'timestamp': msg_data['internalDate'],
                'sender_profile_picture': None  # Can be added if needed
            })

    except Exception as e:
        print(f"Error fetching emails: {str(e)}")

    return emails
