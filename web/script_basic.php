<?php

// using ldap bind
$ldaprdn  = 'cn=admin,dc=example,dc=org';     // ldap rdn or dn
$ldappass = 'admin';  // associated password

// connect to ldap server
$ldapconn = ldap_connect("ldap://openldap")
    or die("Could not connect to LDAP server.");

// binding to ldap server
$ldapbind = ldap_bind($ldapconn, $ldaprdn, $ldappass)
    or die('LDAP bind failed');

$exampleuser = "cn=coba1,ou=users,dc=example,dc=org";
// test password lama
$ldapbind = ldap_bind($ldapconn, $exampleuser, "coba1")
    or die('LDAP bind failed');

echo "password lama aman";

// set the password back to "secret"
ldap_exop_passwd($ds, $exampleuser, "coba1", "gantipass");

$ldapbind = ldap_bind($ldapconn, $exampleuser, "gantipass")
    or die('LDAP bind failed');

echo "ganti password sukses";

ldap_close($ds);
