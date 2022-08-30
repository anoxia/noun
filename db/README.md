
### env

```
# Database
IMAGE_MONGO = mongo:5.0
IMAGE_DYNAMODB = amazon/dynamodb-local

# 端口配置
DYNAMO_PORT = 8000
MONGO_PORT = 27017
```

### docker-compose.yaml

```yaml

version: "3"

services:
  mongo:
    image: ${IMAGE_MONGO}
    ports:
      - ${MONGO_PORT}:27017
    volumes:
      - ${WORKSPACE}/db/data/mongodb:/data/db
    deploy:
      resources:
        limits:
          memory: 500M

  dynamodb:
    image: ${IMAGE_DYNAMODB}
    environment:
      - ./Djava.library.path=./DynamoDBLocal_lib
    ports:
      - ${DYNAMO_PORT}:8000
    volumes:
      - ${WORKSPACE}/db/data/dynamodb:/home/dynamodblocal/data
    command:
      ["-jar", "DynamoDBLocal.jar", "-sharedDb", "-dbPath", "./data"]
    deploy:
      resources:
        limits:
          memory: 400M
        reservations:
          memory: 50M

```
