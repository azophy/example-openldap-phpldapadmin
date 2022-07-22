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
Container::addConnection($connection);

$users = User::get();

print_r($users);
