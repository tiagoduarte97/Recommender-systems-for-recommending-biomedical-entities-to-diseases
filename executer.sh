#!/bin/bash

echo "Selecione uma opção:"
echo "1. Digitar o nome da doença"
echo "2. Digitar o número DOID da doença"
echo "3. Sair"
read opcao

case $opcao in
  1)
    echo "Digite o nome da doença:"
    read name
    uri=$(echo "$name" | ./geturi.sh doid.owl)
    if [ -z "$uri" ]; then
      echo "Não foi possível encontrar uma URI para a doença informada"
      exit 1
    fi
    echo "Ancestrais da doença $name:"
    ;;
  2)
    echo "Digite o número DOID da doença:"
    read doid_number
    uri="http://purl.obolibrary.org/obo/DOID_$doid_number"
    echo "Ancestrais da doença DOID_$doid_number:"
    ;;  
  3)
    exit 1
    ;;
  *)
    echo "Opção inválida"
    exit 1
    ;;
esac

if [ -n "$uri" ]; then
  echo "Ancestrais em formato DOID:"
  echo "$uri" | ./getancestors.sh doid.owl
  echo "Ancestrais em formato nome da doença:"
  echo "$uri" | ./getancestors.sh doid.owl 2>/dev/null | ./getlabels.sh doid.owl
fi

