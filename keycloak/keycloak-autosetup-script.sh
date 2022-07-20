# keycloak-autosetup-example.sh
# Adapted from : https://keycloak.ch/keycloak-tutorials/tutorial-1-installing-and-running-keycloak/

# basic variables. edit as needed
KCADM="/opt/keycloak/bin/kcadm.sh"
REALM_NAME=test_realm
CLIENT_ID=test_client
CLIENT_NAME="Test Client"

# establish connection session to keycloak
$KCADM config credentials --server http://localhost:8080 \
--user admin \
--password admin \
--realm master

# test connection
$KCADM get serverinfo

# setup new realm
$KCADM create realms -s realm="${REALM_NAME}" -s enabled=true

# setup client
$KCADM create clients -r ${REALM_NAME} \
-s clientId="${CLIENT_ID}" \
-s enabled=true \
-s name="${CLIENT_NAME}" \
-s protocol=openid-connect \
-s publicClient=true \
-s standardFlowEnabled=true \
-s 'redirectUris=["http://localhost:8000/*"]' \
-s baseUrl="http://localhost:8000" \
-s 'webOrigins=["*"]'

