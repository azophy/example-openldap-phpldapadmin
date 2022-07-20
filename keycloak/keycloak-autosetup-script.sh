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

# create user ldap provider
$KCADM create components -r ${REALM_NAME}  -f - << EOF
{
  "name": "ldap",
  "providerId": "ldap",
  "providerType": "org.keycloak.storage.UserStorageProvider",
  "parentId": "test_realm",
  "config": {
    "enabled": [
      "true"
    ],
    "priority": [
      "0"
    ],
    "fullSyncPeriod": [
      "604800"
    ],
    "changedSyncPeriod": [
      "86400"
    ],
    "cachePolicy": [
      "DEFAULT"
    ],
    "evictionDay": [],
    "evictionHour": [],
    "evictionMinute": [],
    "maxLifespan": [],
    "batchSizeForSync": [
      "1000"
    ],
    "editMode": [
      "WRITABLE"
    ],
    "importEnabled": [
      "true"
    ],
    "syncRegistrations": [
      "true"
    ],
    "vendor": [
      "other"
    ],
    "usePasswordModifyExtendedOp": [],
    "usernameLDAPAttribute": [
      "uid"
    ],
    "rdnLDAPAttribute": [
      "uid"
    ],
    "uuidLDAPAttribute": [
      "entryUUID"
    ],
    "userObjectClasses": [
      "inetOrgPerson, organizationalPerson"
    ],
    "connectionUrl": [
      "ldap://openldap:389"
    ],
    "usersDn": [
      "ou=users,dc=example,dc=org"
    ],
    "authType": [
      "simple"
    ],
    "startTls": [],
    "bindDn": [
      "cn=admin,dc=example,dc=org"
    ],
    "bindCredential": [
      "admin"
    ],
    "customUserSearchFilter": [],
    "searchScope": [
      "1"
    ],
    "validatePasswordPolicy": [
      "false"
    ],
    "trustEmail": [
      "false"
    ],
    "useTruststoreSpi": [
      "ldapsOnly"
    ],
    "connectionPooling": [
      "true"
    ],
    "connectionPoolingAuthentication": [],
    "connectionPoolingDebug": [],
    "connectionPoolingInitSize": [],
    "connectionPoolingMaxSize": [],
    "connectionPoolingPrefSize": [],
    "connectionPoolingProtocol": [],
    "connectionPoolingTimeout": [],
    "connectionTimeout": [],
    "readTimeout": [],
    "pagination": [
      "true"
    ],
    "allowKerberosAuthentication": [
      "false"
    ],
    "serverPrincipal": [],
    "keyTab": [],
    "kerberosRealm": [],
    "debug": [
      "false"
    ],
    "useKerberosForPasswordAuthentication": [
      "false"
    ]
  }
}
EOF
