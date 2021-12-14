IMAGE=thetorproject/snowflake-proxy

.PHONY: tag
tag:
	@[ "${VERSION}" ] || ( echo "Env var VERSION is not set."; exit 1 )
	docker tag $(IMAGE) $(IMAGE):$(VERSION)
	docker tag $(IMAGE) $(IMAGE):latest

.PHONY: release
release:
	@[ "${VERSION}" ] || ( echo "Env var VERSION is not set."; exit 1 )
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):latest

.PHONY: build
build:
	docker build --build-arg VERSION=$(VERSION) -t $(IMAGE) .

.PHONY: deploy
deploy:
	docker-compose up -d snowflake-proxy
