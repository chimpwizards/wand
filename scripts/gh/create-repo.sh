#!/bin/sh

while [[ $# -gt 0 ]]
do
key="$1"

case $key in

    -u|--usage)
    help="true"
    shift # past argument
    ;;

    -n|--name)
    export NAME="$2"
    shift # past argument
    ;;

    --default)
    ;;
    *)
          # unknown option
    ;;
esac
shift # past argument or value
done

# Show help
if [[ $help == "true" ]]; then
    echo """
Usage: w x new-repo [options]


Options:
  --name  Name of the repo to create                            [string]
  --usage Show help                                             [boolean]

(copyrigth) chimpwizards.com 2020
for more information, find our manual at http://chimpwizards.com/wand

Must provide a valid command    
    """
    exit
fi

gh repo create  chimpwizards-wand/$NAME --confirm --public