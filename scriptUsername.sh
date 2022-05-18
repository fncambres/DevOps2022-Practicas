#!/bin/bash
# Alumno Federico Nicolas Cambres
# Email fncambres@gmai.com

echo ""
echo "***************************************************************"
echo "Script para verificar la existencia de un usuario en el S.O"
echo "***************************************************************"
echo ""
read -p  "Ingrese el usuario a verificar:" username
username=$(echo "$username" | tr '[:upper:]' '[:lower:]')
echo ""
var=$(cat /etc/passwd | cut -d":" -f1 | grep -w $username)

if [ "$var" ]
then
    echo "El usuario $var EXISTE en el /etc/passwd"
    echo ""
else
    echo "El usuario $username NO EXISTE en el /etc/passwd"
    echo ""
fi

echo "Desea realizar otra operación:[y/n]"
 
read iniciarform
 
if [ "$iniciarform" = "y" ]
then 
     clear
     bash scriptUsername.sh
else 
     exit
fi