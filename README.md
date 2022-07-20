Experiment deploying OpenLDAP with PhpLdapAdmin
===============================================

![Screenshot](/misc/screenshot.png?raw=true "Example local PhpLdapAdmin instance")

## How to use
1. clone this repo
2. cd to the folder then run `docker compose up`
3. Setup:
  - import example LDAP entries:
    ```
    docker compose exec openldap sh /app/load-seed-ldif.sh
    ```
    this repo included some example users and groups you could try:
    - username: coba1 , password: coba1
    - username: coba2 , password: coba2
  - setup keycloak:
    you need to setup realm, client, and user federation for ldap. or you could use the script to set example settings:
    ```
    docker compose exec keycloak sh /app/keycloak-autosetup-script.sh

    ```
4. Website is up:
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
