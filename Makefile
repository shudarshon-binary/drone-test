# grep the latest tag version from git repository
VERSION=$(shell ./version.sh)

.PHONY: help

help: ## Helpful commands
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

local/build: ## Build the docker image in local
	@echo 'build docker image'
	sudo docker build -t regentmarkets/test-nodejs-cicd:latest -t regentmarkets/test-nodejs-cicd:$(VERSION) .

local/run: ## Spin up the project in local
	@echo 'run the project'
	sudo docker-compose up -d

clean: ## Clear docker artifacts from local machine
	@echo 'clear project containers, volumes and network'
	sudo docker-compose down

dev: local/build local/run ## Build and deploy docker image in local machine
