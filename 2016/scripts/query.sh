publicURL="http://192.168.8.80:8080/v1/AUTH_test"
token="AUTH_tkd749c417e2c049af898f0960f5230958"

# Get token
curl -v \
     -H "X-Auth-User: test:tester" \
     -H "X-Auth-Key: testing" \
     http://192.168.8.80:8080/auth/v1.0/

#curl -i $publicURL/archive -X PUT -H "Content-length: 0" -H "X-Auth-Token: $token"

# Create a 'current' container to store current version of an object

#curl -i $publicURL/current -X PUT -H "Content-length: 0" -H "X-Auth-Token: $token" \
#     -H "X-Versions-Location: archive"

# Create a binary object "my_object" in 'current' container
# There should be nothing in 'archive'

# curl -i $publicURL/current/my_object --data-binary 1 -X PUT \
#      -H "Content-length: 0" \
#      -H "X-Auth-Token: $token"


# Create a second version of an object

# curl -i $publicURL/current/my_object --data-binary 2 -X PUT \
#      -H "Content-length: 0" \
#      -H "X-Auth-Token: $token"


# Get the non-current version of object

# curl -i $publicURL/archive?prefix=009my_object -X GET \
#      -H "X-Auth-Token: $token"

# Deleting the current object will replace current object with the
# most recent version of object from 'archive' container

# curl -i $publicURL/swift-ui -X DELETE\
#       -H "X-Auth-Token: $token"


# Disable object versioning
# curl -i $publicURL/current -X PUT -H "Content-Length: 0" \
#      -H "X-Auth-Token: $token" -H "X-Versions-Location: "


# JSON format o/p

# curl -i $publicURL?format=json -X GET \
#      -H "X-Auth-Token: $token"


# XML format o/p

# curl -i $publicURL -X GET \
#      -H "X-Auth-Token: $token" \
#      -H "Accept: application/xml"


# curl -X GET -i -H "X-Auth-Token: $token" $publicURL/archive?delimiter=/

# curl -i $publicURL/p-archive?prefix=008cat6.jpg -X GET -H "X-Auth-Token: $token"


