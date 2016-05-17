publicURL="http://192.168.8.80:8080/v1/AUTH_wasteland"
authURL="http://192.168.8.80:8080/auth/v1.0/"

# Get token
# curl -v \
#      -H "X-Auth-User: admin:admin" \
#      -H "X-Auth-Key: admin" \
#      $authURL

# curl -v \
#      -H "X-Auth-User: test:tester" \
#      -H "X-Auth-Key: testing" \
#      $authURL

# curl -v \
#      -H "X-Auth-User: wasteland:psachin" \
#      -H "X-Auth-Key: psachin" \
#      $authURL

admin_token="AUTH_tk93e58dc8ee124a95bd9715fd963fd2e3"
tester_token="AUTH_tka56d8d7e7e4c429088a2f962bbcf47ab"
psachin_token="AUTH_tk58c201d4adbb46118eb15491b1a679ae"

# Verifying Account Access
# curl -v \
#      -H "X-Storage-Token: $psachin_token" \
#      $publicURL

# Creating a container
# curl -v \
#      -H "X-Storage-Token: $token" \
#      -X PUT $publicURL/keys

# Verifying a container
# curl -v \
#      -H "X-Storage-Token: $tester_token" \
#      -X GET $publicURL/photos


# # Uploading an object
# curl -v \
#      -H "X-Storage-Token: $token" \
#      -X PUT $publicURL/keys/mykey.pem -T mykey.pem

# Download an object
# curl -v \
#      -H "X-Storage-Token: $token" \
#      -X GET $publicURL/keys/mykey.pem > mykey.pem


# --------------------

# curl -X GET -i  -H  “X-Auth-Token: $TOKEN”  $STORAGE_URL/container1/photo.jpg

# curl -i $publicURL/archive -X PUT -H "Content-length: 0" -H "X-Auth-Token: $token"

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
