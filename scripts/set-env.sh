#!/bin/sh
echo "Scripts folder: $(dirname \"${BASH_SOURCE[0]}\")"

# Set secrets
export GITHUBPAT=$(cat ./lockbox/files/GITHUB.KEY)
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
export GIT_SSL_NO_VERIFY=true
npm config set cafile $NODE_EXTRA_CA_CERTS --global
#git config http.sslCAinfo $NODE_EXTRA_CA_CERTS
#git -c http.sslVerify=false clone https://github.com/chimpwizards/wand
#pip config set global.cert $NODE_EXTRA_CA_CERTS

export NODE_TLS_REJECT_UNAUTHORIZED=0

# PATHS
export SCRIPT_PATH=$(cd `dirname ${0}`; pwd)
export SCRIPT_PARENT=$(dirname -- $SCRIPT_PATH)


#
# REFERENCE:
#
# - https://docs.microsoft.com/en-us/cli/azure/use-cli-effectively?view=azure-cli-latest
# - https://stackoverflow.com/questions/11621768/how-can-i-make-git-accept-a-self-signed-certificate
#