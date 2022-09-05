## 순서

1. rabbit-mq 실행
2. mysql-db 실행
3. kafa 실행 (zookeeper 실행 > server 실행 > connector 실)행
4. spring-config 실행
5. discoverty-server 실
6. apigateway/user/order/catalog 서비스 실행
7. connect sync 추가, create-connector.http 참고

docker

docker system prune : 사용하지 않는 것들 다 삭제
docker ps
docker container ls -a

docker network ls

docker network create --gateway 172.18.0.1 --subnet 172.18.0.0/16 ecommerce-network : 브릿지 네트워크 생성

docker network inspect ecoomerce-network : 스팩 확인
-d detach mode
-it 
--name 이름
## Rabit mq
docker run -d --name rabbitmq --network ecommerce-network \
-p 15672:15672 -p 5672:5672 -p 15671:15671 -p 5671:5671 -p 4369:4369 \
-e RABBITMQ_DEFAULT_USER=guest \
-e RABBITMQ_DEFAULT_PASS=guest rabbitmq:management

## mariadb
cd sampleDb
docker build -t askyclear/my_mariadb:1.0 .

docker run -d -p 3306:3306 --network ecommerce-network  --name mariadb askyclear/my_mariadb:1.0
## zookeeper/ kafka
https://github.com/wurstmeister/kafka-docker 참고


## zipkin
docker run -d -p 9411:9411 \
--network ecommerce-network \
--name zipkin \
openzipkin/zipkin

## prometheus
docker run -d -p 9090:9090 --network ecommerce-network \
--name prometheus \
-v /Users/user/IdeaProjects/msa-study-config-info/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
prom/prometheus


## grafana
docker run -d -p 3000:3000 --network ecommerce-network --name grafana grafana/grafana



