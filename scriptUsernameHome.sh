#!/bin/bash
# Alumno Federico Nicolas Cambres
# Email fncambres@gmai.com

echo ""
echo "***************************************************************"
echo "Script para verificar la existencia de un usuario en el S.O y su HOME"
echo "***************************************************************"
echo ""
read -p  "Ingrese el usuario a verificar:" username
username=$(echo "$username" | tr '[:upper:]' '[:lower:]')
echo ""
user=$(cat /etc/passwd | cut -d":" -f1 | grep -w $username)
homedir=$(cat /etc/passwd | cut -d":" -f6 | grep -w $username)

if [ "$user" ]
then
    echo ""
    echo "El usuario $user EXISTE en el /etc/passwd"
    echo ""
    echo "El directorio del usuario $user es $homedir"
    echo ""
else
    echo "El usuario $username NO EXISTE en el /etc/passwd y no tiene HOME"
    echo ""
fi

echo "Desea realizar otra operación:[y/n]"
 
read iniciarform
 
if [ "$iniciarform" = "y" ]
then 
     clear
     bash scriptUsernameHome.sh
else 
     exit
fi