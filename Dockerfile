FROM golang:1.18-alpine as base
ENV CGO_ENABLED=0
WORKDIR /opt/app
COPY go.mod .
COPY go.sum .
RUN go mod download -x
COPY . .
RUN --mount=type=cache,target=/root/.cache/go-build \
    go build -o /out/app src/cmd/main.go

FROM base AS unit-test
RUN --mount=type=cache,target=/root/.cache/go-build \
    go test -v ./...

FROM golangci/golangci-lint:v1.46.2-alpine as lint-base

FROM base as lint
COPY --from=lint-base /usr/bin/golangci-lint /usr/bin/golangci-lint
RUN --mount=type=cache,target=/root/.cache/go-build \
    --mount=type=cache,target=/root/.cache/golangci-lint \
      golangci-lint run --timeout 10m0s ./...

FROM base as build-dev
RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN --mount=type=cache,target=/root/.cache/go-build \
    go build -gcflags="all=-N -l" -o /bin/app src/cmd/main.go
EXPOSE 3000 40000
CMD ["/dlv", "--listen=:40000", "--headless=true", "--api-version=2", "--accept-multiclient", "exec", "/bin/app"]

FROM scratch as build
EXPOSE 3000 40000
COPY --from=base /out/app .
CMD ["./app"]