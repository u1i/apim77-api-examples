. ./auth.sh

if [ "$#" != "2" ]
then
  echo Need parameters: Name for the new API and ID of the backend API
  echo example: 02-create-frontend-api-from-backend-api.sh MyAPI a49ae308-029f-4aea-b122-3089f90f7468
  exit 1
fi

apiname=$1
api=$2

curl --location --request POST "https://127.0.0.1:8075/api/portal/v1.3/proxies" \
-k -u "$username:$password" \
--header 'Content-Type: application/json' \
--data-raw '{
  "organizationId": "'''$organization'''",
  "apiId": "'''$api'''",
  "name": "'''$apiname'''",
  "version": 1,
  "apiRoutingKey": 1,
  "vhost": "host.company.com",
  "path": "/flikr",
  "descriptionType": "manual",
  "descriptionManual": "My API",
  "descriptionMarkdown": "",
  "descriptionUrl": "http://doc.api.org/myapi/mymethod",
  "summary": "My API\n====\n\nThis is my API.",
  "retired": false,
  "expired": false,
  "image": "resources/photo.jpg",
  "retirementDate": 1364287486876,
  "deprecated": true,
  "state": "unpublished",
  "corsProfiles": [
    {
      "name": "Default Security Profile",
      "isDefault": false,
      "origins": [
        "http://api.google.com",
        "http://api.flickr.com"
      ],
      "allowedHeaders": [
        "X-Request-Value",
        "X-Hello-World"
      ],
      "exposedHeaders": [
        "X-Trace",
        "X-CorrelationID"
      ],
      "supportCredentials": false,
      "maxAgeSeconds": 84600
    }
  ],
  "securityProfiles": [
    {
      "name": "Default Security Profile1",
      "isDefault": false,
      "devices": [
        {
          "name": "My Pass-through Device",
          "type": "apiKey",
          "order": 1,
          "properties": {
            "apiKeyFieldName": "APIKey",
            "takeFrom": "HEADER"
          }
        }
      ]
    }
  ]
}'
