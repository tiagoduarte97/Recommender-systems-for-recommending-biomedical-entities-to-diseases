OWLFILE=$1
CLASSES=$(cat -)
[[ -z "$CLASSES" ]] && exit
PARENTS=$(echo "$CLASSES" | ./getparents.sh $OWLFILE |sort -u)
echo "$PARENTS"
echo "$PARENTS" | ./getancestors.sh $OWLFILE
