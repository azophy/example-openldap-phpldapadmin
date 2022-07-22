<?php

require __DIR__ . '/vendor/autoload.php';

use LdapRecord\Container;
use LdapRecord\Connection;
use LdapRecord\Models\OpenLDAP\User;

// create a new connection:
$connection = new Connection([
    'hosts' => ['openldap'],
    'port' => 389,
    'base_dn' => 'dc=example,dc=org',
    'username' => 'cn=admin,dc=example,dc=org',
    'password' => 'admin',
]);

// Add the connection into the container:
//Container::addConnection($connection);

//$users = User::get();
//print_r($users);
//echo(count($users));

//$coba1dn = 'cn=coba aja,ou=users,dc=example,dc=org';
$coba1dn = 'uid=coba1,ou=users,dc=example,dc=org';
if ($connection->auth()->attempt($coba1dn, 'coba1', $stayAuthenticated = true)) {
    echo 'bind success';
} else {
    echo 'bind failed';
}
//$coba1 = User::find($coba1dn);

