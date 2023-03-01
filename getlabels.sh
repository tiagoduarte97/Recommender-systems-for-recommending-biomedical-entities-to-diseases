OWLFILE=$1
xargs -I {} xmllint --xpath "//*[local-name()='Class'][@*[local-name()='about']='{}']/*[local-name()='label']/text()" $OWLFILE
