#!/bin/sh

cat > /tmp/ndru <<EOF
     %echo Generating a basic OpenPGP key
     Key-Type: DSA
     Key-Length: 1024
     Subkey-Type: ELG-E
     Subkey-Length: 1024
     Name-Real: ndruwizz
     Name-Comment: with stupid passphrase
     Name-Email: ndru@chimpwizard.com
     Expire-Date: 0
     Passphrase: changeit
     # Do a commit here, so that we can later print "done" :-)
     %commit
     %echo done
EOF
gpg --batch --generate-key /tmp/ndru

gpg --list-keys ndru@chimpwizard.com

git-crypt add-gpg-user --trusted ndru@chimpwizard.com