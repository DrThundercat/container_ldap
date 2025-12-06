podman compose -f blueprint.yml up -- brings up the containers
podman compose -f blueprint.yml build --> Makes a new image
podman compose -f blueprint.yml up -d -- brings up the containers detached

image source
https://quay.io/repository/389ds/dirsrv?tab=info

image docs
https://www.port389.org/docs/389ds/howto/howto-deploy-389ds-on-openshift.html

reset dm
https://www.port389.org/docs/389ds/howto/howto-resetdirmgrpassword.html