##!/bin/bash

#Esse script verifica se os diretorios que serão criados, existem, senão cria eles.
#Logo depois os grupos são criados e depois são criados os usuarios com seus grupos devidos

echo "Verificando se ja existem os diretorios e cria se não existir..."
sleep 1

for DIRECTORY in {"publico","adm","ven","sec"}
do
	if [ -d "/$DIRECTORY" ]; then
	 echo "Diretorio ja existe!!!"
	else
	 echo "Criando diretorio $DIRECTORY..."
	 sleep 1
	 sudo mkdir /$DIRECTORY
	fi
done

for GRP in {"GRP_ADM","GRP_VEN","GRP_SEC"}
do
	echo "Criando o grupo $GRP..."
	sleep 1
	sudo groupadd $GRP
done

for USER_ADM in {carlos,maria,joao}
do
	echo "Criando usuarios do grupo ADM..."
	sudo useradd $USER_ADM -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
	sleep 1
done

for USER_VEN in {debora,sebastiana,roberto}
do
	echo "Criando usuarios do grupo VEN..."
	sudo useradd $USER_VEN -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
	sleep 1
done

for USER_SEC in {josefina,amanda,rogerio}
do
	echo "Criando usuarios do grupo SEC..."
	sudo useradd $USER_SEC -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
	sleep 1
done

sudo chown root:GRP_ADM /adm
sudo chown root:GRP_SEC /ven
sudo chown root:GRP_VEN /sec




	



