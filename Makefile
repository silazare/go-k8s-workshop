GOOS?=linux
GOARCH?=amd64

PROJECT?=github.com/silazare/go-k8s-workshop
BUILD_PATH?=cmd/go-server
APP?=nsk

PORT?=8080

# Current version
RELEASE?=0.0.1

# Parameters to push images and release app to Kubernetes or try it with Docker
REGISTRY?=docker.io/exciter86
NAMESPACE?=silazare
CONTAINER_NAME?=${NAMESPACE}-${APP}
CONTAINER_IMAGE?=${REGISTRY}/${CONTAINER_NAME}
VALUES?=values-stable

build:
	docker build -t $(CONTAINER_IMAGE):$(RELEASE) .

push: build
	docker push $(CONTAINER_IMAGE):$(RELEASE)
