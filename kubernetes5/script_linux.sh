#!/bin/bash

echo "Criando as imagens...."

docker build -t davi38/projeto-dio-backend:1.0 backend/.
echo "backend imagem criada"

docker build -t davi38/projeto-dio-database:1.0 database/.
echo "database imagem criada"

echo "Levando imagens ao  dockerpush"
docker push davi38/projeto-dio-backend:1.0 backend/.
docker push davi38/projeto-dio-database:1.0 database/.
 echo "Pushed images."

 echo "Criando serviçoes no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments....."

kubectl apply -f ./deployment.yml
