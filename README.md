# base-golang

**WIP**

Repositório template para webservices escritos em Go.

## Dependências

- Docker
- GNU Make

## Como executar

Com as dependências instaladas, você pode executar o projeto via:
```shell
$ make run
```

Alternativamente, para rodar em modo watcher, execute:
```shell
$ make run-watch
```

A partir daí, qualquer alteração em arquivos Go do projeto, restartarão a app.

## Desenvolvimento

Este projeto contém alguns arquivos que facilitam o desenvolvimento e debugging via Visual Studio Code. Ao abrir o projeto,
a IDE irá recomendar a instalação de algumas extensões necessárias para debugging e execução do projeto via devcontainer. Uma
vez feita a instalação, será possível reiniciar o vscode dentro de um container Docker que permitirá executar e debugar o projeto

## Testes & Linter

Os testes podem ser executados via:

```shell
$ make unit-test
```

... bem como o linter:

```shell
$ make lint
```

## Deployment

O deployment pode ser executado copiando o binário gerado na pasta `bin/` para execução
em uma VM. Execute:
```shell
$ make
```

... para gerar o binário pronto para uso em produção.

