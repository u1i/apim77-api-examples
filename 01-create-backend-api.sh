. ./auth.sh

curl -s -k --location --request POST "$apim/api/portal/v1.3/apirepo/import" \
--header 'Accept: application/json' \
--header 'Content-Type: multipart/form-data' \
-u "$username:$password" \
--form "organizationId=$organization" \
--form 'name=google-payments' \
--form 'type=swagger' \
--form 'file=@google.json' | tee -a out.log | tr "," "\n" | head -1
