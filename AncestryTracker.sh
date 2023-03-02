#!/bin/bash

echo "select an option:"
echo "1. Enter disease name"
echo "2. Enter the DOID number of the disease"
echo "3. Exit
read opcao

case $opcao in
  1)
    echo "Enter disease name:"
    read name
    uri=$(echo "$name" | ./geturi.sh doid.owl)
    if [ -z "$uri" ]; then
      echo "Unable to find a URI for the reported disease"
      exit 1
    fi
    echo "ancestors of the disease $name:"
    ;;
  2)
    echo "Enter the DOID number of the disease:"
    read doid_number
    uri="http://purl.obolibrary.org/obo/DOID_$doid_number"
    echo "Ancestors of DOID disease_$doid_number:"
    ;;  
  3)
    exit 1
    ;;
  *)
    echo "Error"
    exit 1
    ;;
esac

if [ -n "$uri" ]; then
  echo "Ancestors in DOID format:"
  echo "$uri" | ./getancestors.sh doid.owl
  echo "Ancestors in disease name format:"
  echo "$uri" | ./getancestors.sh doid.owl 2>/dev/null | ./getlabels.sh doid.owl
fi

