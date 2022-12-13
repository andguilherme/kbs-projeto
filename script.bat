echo "Criando as imagens.....   "

docker build -t andersongui/projeto-backend:1.0 backend/.
docker build -t andersongui/projeto-database:1.0 database/.

echo "realizando push das imagens...."

docker push andersongui/projeto-backend:1.0
docker push andersongui/projeto-database:1.0

echo "Criando serviços no cluster kubernetes...."

kubectl apply -f  ./services.yml

echo "Criando deployments...."

kubectl apply -f  ./deployment.yml