all: bin/app
test: unit-test

.PHONY: run
run:
	@docker build . --target webservice --tag="base_golang:latest" \
	&& docker run -it --rm -p:3000:3000 base_golang:latest

.PHONY: run-watch
run-watch:
	@docker build . --target webservice-watch --tag="base_golang_watch:latest" \
	&& docker run -it --rm -p:3000:3000 -v ${PWD}:/opt/app base_golang_watch:latest

.PHONY: bin/app
bin/app:
	@docker build . --target webservice \
		--output bin/

.PHONY: unit-test
unit-test:
	@docker build . --target unit-test

.PHONY: lint
lint:
	@docker build . --target lint