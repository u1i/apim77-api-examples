. ./auth.sh

curl -k -u "$username:$password" "$apim/api/portal/v1.3/discovery/apis"
