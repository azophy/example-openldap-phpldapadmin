ldapadd -x \
        -D "cn=admin,dc=example,dc=org" \
        -w admin \
        -H ldap:// \
        -f /app/seed.ldif
