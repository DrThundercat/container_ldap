#!/usr/bin/env bash


dsconf localhost backend create --suffix "o=farmers" --be-name "farmers" 

if [[ ! -d /data/ldif/ous ]]; then
    mkdir -p /data/ldif/ous
    mkdir -p /data/ldif/ous/farmers
    mkdir -p /data/ldif/ous/type_farmers
    mkdir -p /data/ldif/ous/fruit_type_farmers
    mkdir -p /data/ldif/ous/vegetable_type_farmers
    mkdir -p /data/ldif/ous/mountain_type_farmers
    mkdir -p /data/ldif/ous/inactive_fruit_type_farmers
    mkdir -p /data/ldif/ous/inactive_vegetable_type_farmers
    mkdir -p /data/ldif/ous/inactive_mountain_type_farmers


    cat >> /data/ldif/ous/farmers/base.ldif <<EOL
dn: o=farmers
objectClass: organizational
o: farmers
EOL
    cat >> /data/ldif/ous/type_farmers/base.ldif <<EOL
dn: ou=type,o=farmers
objectClass: organizationalUnit
ou: type
EOL
    cat >> /data/ldif/ous/fruit_type_farmers/base.ldif <<EOL
dn: ou=fruit,ou=type,o=farmers
objectClass: organizationalUnit
ou: types
ou: fruit
EOL
    cat >> /data/ldif/ous/vegetable_type_farmers/base.ldif <<EOL
dn: ou=vegetable,ou=type,o=farmers
objectClass: organizationalUnit
ou: types
ou: vegetable
EOL
    cat >> /data/ldif/ous/mountain_type_farmers/base.ldif <<EOL
dn: ou=mountain,ou=type,o=farmers
objectClass: organizationalUnit
ou: types
ou: mountain
EOL
    cat >> /data/ldif/ous/inactive_fruit_type_farmers/base.ldif <<EOL
dn: ou=fruit,ou=type,ou=inactive,o=farmers
objectClass: organizationalUnit
ou: types
ou: fruit
ou: inactive
EOL
    cat >> /data/ldif/ous/inactive_vegetable_type_farmers/base.ldif <<EOL
dn: ou=vegetable,ou=type,ou=inactive,o=farmers
objectClass: organizationalUnit
ou: types
ou: vegetable
ou: inactive
EOL
    cat >> /data/ldif/ous/inactive_mountain_type_farmers/base.ldif <<EOL
dn: ou=mountain,ou=type,ou=inactive,o=farmers
objectClass: organizationalUnit
ou: types
ou: mountain
ou: inactive
EOL
fi

ldapadd -x -D "cn=Directory_Manager" -w "appleapple" -H ldap://localhost:3389 -f /data/ldif/ous/farmers/base.ldif
ldapadd -x -D "cn=Directory_Manager" -w "appleapple" -H ldap://localhost:3389 -f /data/ldif/ous/type_farmers/base.ldif
ldapadd -x -D "cn=Directory_Manager" -w "appleapple" -H ldap://localhost:3389 -f /data/ldif/ous/fruit_type_farmers/base.ldif
ldapadd -x -D "cn=Directory_Manager" -w "appleapple" -H ldap://localhost:3389 -f /data/ldif/ous/vegetable_type_farmers/base.ldif
ldapadd -x -D "cn=Directory_Manager" -w "appleapple" -H ldap://localhost:3389 -f /data/ldif/ous/mountain_type_farmers/base.ldif
ldapadd -x -D "cn=Directory_Manager" -w "appleapple" -H ldap://localhost:3389 -f /data/ldif/ous/inactive_fruit_type_farmers/base.ldif
ldapadd -x -D "cn=Directory_Manager" -w "appleapple" -H ldap://localhost:3389 -f /data/ldif/ous/inactive_vegetable_type_farmers/base.ldif
ldapadd -x -D "cn=Directory_Manager" -w "appleapple" -H ldap://localhost:3389 -f /data/ldif/ous/inactive_mountain_type_farmers/base.ldif