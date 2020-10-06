#!/bin/sh
echo "Scripts folder: $(dirname \"${BASH_SOURCE[0]}\")"

# Set secrets
export PAT=$(cat ./lockbox/files/GIT.KEY)
export NPMPAT=$(cat ./lockbox/files/NPM.KEY)

# Set project defaults
export ACCOUNT=chimpwizards
export ORG=https://github.com/$ACCOUNT
export PROJECT_ROOT="$ACCOUNT/wand"
export PROJECT_DEPENDENCIES="$ACCOUNT-wand"
export GIT=https://github.com/$PROJECT_DEPENDENCIES
export VERSION=`node -e "var json=require('./package.json'); console.log(json.version)"`
export RELEASE=$(echo $VERSION|cut -d'.' -f1,2)


# Set certificates
export NODE_EXTRA_CA_CERTS=$PWD/lockbox/certs/self-signed-bundle.pem
export REQUESTS_CA_BUNDLE=$PWD/lockbox/certs/self-signed-bundle.pem
export CA_BUNDLE=$REQUESTS_CA_BUNDLE
export SSL_CERT_FILE=$REQUESTS_CA_BUNDLE
npm config set cafile=$NODE_EXTRA_CA_CERTS

#
# REFERENCE:
#
# - https://docs.microsoft.com/en-us/cli/azure/use-cli-effectively?view=azure-cli-latest
#