Experiment deploying OpenLDAP with PhpLdapAdmin
===============================================

![Screenshot](/misc/screenshot.png?raw=true "Example local PhpLdapAdmin instance")

## How to use
1. clone this repo
2. cd to the folder then run `docker compose up`
3. Setup:
  - import example LDAP entries:
  - setup example keycloak realm & client:
    ```
    docker compose exec keycloak sh /app/keycloak-autosetup-example.sh

    ```
3. Website is up:
  - PhpLdapAdmin available at http://localhost:8080 . Default login:
    > Login DN: "cn=admin,dc=example,dc=org"
    > Password: admin
  - Keycloak available at http://localhost:8081 . Default login:
    > user: admin
    > Password: admin
  - Sample FE client available at http://localhost:8000 . Use login provided by LDAP
## adapted from
- https://github.com/Ramhm/openldap/blob/master/docker-compose.yml
- https://github.com/osixia/docker-phpLDAPadmin#openldap--phpldapadmin-in-1
