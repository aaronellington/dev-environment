.PHONY: build interactive test publish
SHELL=/bin/bash -o pipefail

build:
	docker build --platform linux/amd64,linux/arm64 . -t ghcr.io/aaronellington/dev-environment:latest

interactive:
	docker run --rm -it ghcr.io/aaronellington/dev-environment:latest

test: build interactive

publish: build
	docker push ghcr.io/aaronellington/dev-environment:latest
