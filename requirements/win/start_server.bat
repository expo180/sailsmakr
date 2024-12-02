@echo off
REM
set "USER_DOCUMENTS=%USERPROFILE%\Documents"
set "DATABASE_PATH=%USER_DOCUMENTS%\sailsmakr\app.db"
set "DIST_PATH=D:\sailsmakr-integration\dist"
set "BUNDLED_ENV_FILE=%DIST_PATH%\.env"

REM
if not exist "%USER_DOCUMENTS%\sailsmakr" mkdir "%USER_DOCUMENTS%\sailsmakr"

REM
if not exist "%DATABASE_PATH%" (
    type nul > "%DATABASE_PATH%"
)

REM
if exist "%BUNDLED_ENV_FILE%" (
    (
        echo SECRET_KEY=AAAAB3NzaC1yc2EAAAADAQABAAABAQCjrFncQTzkFeeK7GB7b2Y6CqGBAiuovcWeWr3W1dqwZHu86kJxuNSAEUnJ
        echo DEV_DATABASE_URL=sqlite:///%DATABASE_PATH%
        echo PRODUCTION_DATABASE_URL=postgresql://awesomebss39:i6Lxe1tQakdV@ep-dawn-hill-78600666.us-east-2.aws.neon.tech/afrilog?sslmode=require
        echo GOOGLE_CLIENT_ID=874918143904-upsmrq0qgt1qrlka1kc0g956kvnattg6.apps.googleusercontent.com
        echo GOOGLE_PROJECT_ID=afrilog-423811
        echo GOOGLE_AUTH_URI=https://accounts.google.com/o/oauth2/auth
        echo GOOGLE_TOKEN_URI=https://oauth2.googleapis.com/token
        echo GOOGLE_REFRESH_TOKEN=https://oauth2.googleapis.com/token
        echo GOOGLE_AUTH_PROVIDER_X509_CERT_URL=https://www.googleapis.com/oauth2/v1/certs
        echo GOOGLE_CLIENT_SECRET=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
        echo GOOGLE_REDIRECT_URIS=http://localhost
        echo NEWS_API_KEYS=pub_444793d8c9fbfe2988fda581f59087a8a0d1d
        echo OPENCAGE_API_KEY=9e97a45472874d7a8b1145e39dfa5ebc
        echo FEDEX_URL=https://apis.fedex.com/rate/v1/rates/quotes
        echo FREIGHTOS_API_KEY=54YQoB7qN0h6eua6HVRrofz4PnQOlhxB
        echo TOMORROW_API_KEY=GH4Q9xldBsg8IMic76nsdx8XLu9bTzw7 
        echo FIREBASE_TYPE=service_account
        echo FIREBASE_PROJECT_ID=afrilog-797e8
        echo FIREBASE_PRIVATE_KEY_ID=e7f5c6f7f3bcadf049620c5909df7e2b05d3900f
        echo FIREBASE_PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCOC2htY2wdWGYK\nS+yrMdhNOHRigPFe4qRQ0aEZrXGz4kFv7TddvYwy4LuNWuSnbKquqU4Xpp2/sEMQ\n6c3yD3Jhh6ZZO6Fq/0i/9dmHfsTXIV0vhx+omMTrhuX5GWUxzSTgB66IZ6iJpGrb\n11mKdBgZJhzHF27URIwlWZ1hG6kswLjKW8TZ66t30l/U1u13wI8YPk0pUpuNxcqR\n+laWrjud7GTEhtaLORtlBMON5Mfmh9SiXR9V7nk3kF0eJjaBCuh1VA4OPBOTGSKT\nY7EkO+Mp6sqNBTKow741N5Bu7AFHshOs/tYpzlRWb06noCio+mJvLKzMcSkVsDQR\nncV1ql9nAgMBAAECggEARCcUFTwZUSErYHBaXy98xVw7d1G/vdOHnGFgZxYRkooR\n9JaANKFwBa9PPbzpLa2VXVVNa0qdsK3tF83eavBfZI010uWqBtDywmu+0eSQpFnV\nQKsYFQgrn4grim/VXmY79aOp6be2pUf2n4F9bFFUiKiBMUM8gWtcRMVxHfksHBSq\n8je161YfpB0Oo/kLgGu0FVyMwmdpnvLVspqGCMFW2EvX7PCXWIjRi9abFA45JQto\nO7vuEVrstLm5TDTsEbHr3lFdq3/TaN5pwWSpWehqG0/mqo6O3Mrv3SMXFC269tNh\nKU254zM22G05UlmOdG9VAgHx1iFWW44GxHoTj1BTlQKBgQDBpVtV5z2oReA823AK\nGxphU5PnXkcuxnOZe8B4WGaLtO7NCYQ26rGmw1Izd+LcS9oCt7PclfUlZCGWFJjW\nhXUgzGUGF8CZg3eCadaMd99QcYvGuG4sD9n89A73hOT8Ny2GSBB4AaMh26v5XytK\nAXxLrfmZ8ExHqEL9lGaPhWfnhQKBgQC7yHEQQHD4D1XfvBigMTFws53Yxw7cQDQw\nlBffdlNyTKzxYWklHHvL6ug8N32GQCnMRgesW10LxysbSMrT106xgmxe+4WX2DLQ\nIObf/x21sYlUZsQC5wGgyUtPaHKQyRlokc2PjhXLE0xi5Q1I/xIO2MC0n5qOMP6V\n+o6HvD7g+wKBgDKzX7mbJNqVCQQGFEyhEgQfhN8UISEPFp899oPL6XV0tv16G2Lh\nigf2peQR5JT3Sypg/Lepj5jtoZmQ5P9ty9/9hAnXWDcZY8YCfgkjLZX7VLR//2CL\n+fAv2mdWJTogHExHPACftR2dTWaqU0Q6JVgPQgXbE63DUV7hZwT20eCdAoGAMvcM\n0KdcwcaPvQB1Ao03aOom7h3gh6CZSZH4BLs9nKj4yy5v9hWL9+VSkH1TASvK7FkZ\nXgsR7s9ogKg5/FLUVdMbDJBhSrvv1pMHdkXsT1LW/eRCULNXusbHPM8RQQCDd+ES\nlGKwwYQEWFboSyaHRSZI7vzeWrcrcZMmOeq6eh8CgYAmRdvRZl2fUanMp2Vzjiuo\nXxDuHRm3aLF7OcGHwXDhI2Uy8D3FTpSD1ZpxnuPMZzAVaocc8mGuigF0ml6EcHzg\nkKFT5mSKKsYJMX9fkFANQLyTtlE80qRrRuu1+EI7uyfYzU8xX5/J16JFxoBA9wHv\n0FF+dkJtDOmIN0a2ZwavNQ==\n-----END PRIVATE KEY-----\n"
        echo MAIL_SERVER=smtp.gmail.com
        echo MAIL_PORT=587
        echo MAIL_USE_TLS=True
        echo MAIL_USERNAME=awesomebss39@gmail.com
        echo MAIL_DEFAULT_SENDER=awesomebss39@gmail.com
        echo MAIL_PASSWORD=nbnc xiko mwft rwly
        echo SECURITY_PASSWORD_SALT=07fce1fa88fec1e624e0fb81c696c992
        echo GOOGLE_OAUTH_CLIENT_ID=874918143904-cqrvfu4md7k5qe2dm5a26f82fqdllqnq.apps.googleusercontent.com
        echo GOOGLE_OAUTH_CLIENT_SECRET=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
        echo TWILIO_SECRET_CODE=FHJX7V4L1G1DWYJ2SE7UVYBM
        echo TWILIO_AUTH_TOKEN=12e9502346b6c32df09c603742bf5d6c
        echo TWILIO_ACCOUNT_ID_SECRET=AC9271e184652300a5adf8f02ec66a4872
        echo SAILSMAKR_CEO=
        echo SAILSMAKR_HR_MANAGER=
        echo SAILSMAKR_ACCOUNTANT=
        echo SAILSMAKR_SALES_DIRECTOR=test34@gmail.com
        echo SAILSMAKR_AGENTS_EMAILS=agent1@example.com,agent2@example.com,agent3@example.com
        echo LWS_PASSWORD=C@r3ful$9w4dZ
        echo wp_admin_password=j__@vnFz5Zyj9
        echo LOGIN_URL=http://127.0.0.1:5000
        echo PLACEHOLDER_STATIC_URL=http://127.0.0.1:5000/static/img/placeholders/
        echo SECURITY_PASSWORD_SALT=07fce1fa88fec1e624e0fb81c696c992
        REM
    ) > "%BUNDLED_ENV_FILE%"
) else (
    echo Warning: .env file not found in the bundled environment at %BUNDLED_ENV_FILE%
)

REM
cd /d "%DIST_PATH%"
start sails.exe
exit
