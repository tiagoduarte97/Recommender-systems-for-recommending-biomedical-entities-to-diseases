OWLFILE=$1
xargs -I {} xmllint --xpath "//*[local-name()='label' and text()='{}']/../@*[local-name()='about']" $OWLFILE | \
gawk -F\" '{ print $2 }'
