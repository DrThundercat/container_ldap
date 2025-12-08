#!/usr/bin/env bash

# NEW_PW='appleapple' expect << 'EOF'
#     set new_pw $env(NEW_PW)
#     spawn dsconf -D "cn=Directory Manager" localhost directory_manager password_change
#     expect "Enter new directory manager password : "
#     send "$new_pw\r"
#     expect "CONFIRM - Enter new directory manager password : "
#     send "$new_pw\r"
#     expect eof
# EOF

dsconf localhost backend create --suffix "o=farmers" --be-name "farmers" 

if [[ ! -d /data/ldif/ous ]]; then
    mkdir -p /data/ldif/ous
    mkdir -p /data/ldif/ous/farmers
    mkdir -p /data/ldif/ous/type_farmers
    mkdir -p /data/ldif/ous/fruit_type_farmers
    mkdir -p /data/ldif/ous/vegetable_type_farmers
    mkdir -p /data/ldif/ous/mountain_type_farmers
    mkdir -p /data/ldif/ous/inactive_farmers
    mkdir -p /data/ldif/ous/inactive_type_farmers
    mkdir -p /data/ldif/ous/inactive_fruit_type_farmers
    mkdir -p /data/ldif/ous/inactive_vegetable_type_farmers
    mkdir -p /data/ldif/ous/inactive_mountain_type_farmers


    cat >> /data/ldif/ous/farmers/base.ldif <<EOL
dn: o=farmers
objectClass: organization
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
    cat >> /data/ldif/ous/inactive_farmers/base.ldif <<EOL
dn: ou=inactive,o=farmers
objectClass: organizationalUnit
ou: inactive
EOL
    cat >> /data/ldif/ous/inactive_type_farmers/base.ldif <<EOL
dn: ou=type,ou=inactive,o=farmers
objectClass: organizationalUnit
ou: inactive
ou: type
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

ldapadd -x -D "cn=Directory Manager" -w appleapple -H ldap://localhost:3389 -f /data/ldif/ous/farmers/base.ldif
ldapadd -x -D "cn=Directory Manager" -w appleapple -H ldap://localhost:3389 -f /data/ldif/ous/type_farmers/base.ldif
ldapadd -x -D "cn=Directory Manager" -w appleapple -H ldap://localhost:3389 -f /data/ldif/ous/fruit_type_farmers/base.ldif
ldapadd -x -D "cn=Directory Manager" -w appleapple -H ldap://localhost:3389 -f /data/ldif/ous/vegetable_type_farmers/base.ldif
ldapadd -x -D "cn=Directory Manager" -w appleapple -H ldap://localhost:3389 -f /data/ldif/ous/mountain_type_farmers/base.ldif
ldapadd -x -D "cn=Directory Manager" -w appleapple -H ldap://localhost:3389 -f /data/ldif/ous/inactive_farmers/base.ldif
ldapadd -x -D "cn=Directory Manager" -w appleapple -H ldap://localhost:3389 -f /data/ldif/ous/inactive_type_farmers/base.ldif
ldapadd -x -D "cn=Directory Manager" -w appleapple -H ldap://localhost:3389 -f /data/ldif/ous/inactive_fruit_type_farmers/base.ldif
ldapadd -x -D "cn=Directory Manager" -w appleapple -H ldap://localhost:3389 -f /data/ldif/ous/inactive_vegetable_type_farmers/base.ldif
ldapadd -x -D "cn=Directory Manager" -w appleapple -H ldap://localhost:3389 -f /data/ldif/ous/inactive_mountain_type_farmers/base.ldif