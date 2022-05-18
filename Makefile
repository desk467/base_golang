all: bin/app
test: unit-test

.PHONY: run
run:
	@docker build . --target build --tag="base_golang:latest" \
	&& docker run -it --rm base_golang:latest

.PHONY: bin/app
bin/app:
	@docker build . --target build \
		--output bin/

.PHONY: unit-test
unit-test:
	@docker build . --target unit-test

.PHONY: lint
lint:
	@docker build . --target lint