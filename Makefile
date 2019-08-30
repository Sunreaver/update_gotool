ROOT=${GOPATH}/src/golang.org/x
GOLINT=${ROOT}/lint
GOTOOLS=${ROOT}/tools

.PHONY: golint
.PHONY: gotools
.PHONY: protobuf
.PHONY: gopls
.PHONY: gocode
.PHONY: goconvey
.PHONY: gomockgen
.PHONY: gopkgs
.PHONY: go-outline
.PHONY: go-symbols
.PHONY: godef
.PHONY: guru

export GO111MODULE=off

update: golint gocode protobuf goconvey gomockgen go-outline go-symbols gopkgs godef gotools

install:
	cd ${ROOT} && git clone https://github.com/golang/lint
	cd ${ROOT} && git clone https://github.com/golang/tools

godef:
	go get -u -v github.com/rogpeppe/godef

golint:
	go get -u -v github.com/golangci/golangci-lint/cmd/golangci-lint

gopls:
	cd ${GOTOOLS}/cmd/gopls && go install

gotools: golint gocode guru
	cd ${GOTOOLS}/cmd/goimports && go install
	cd ${GOTOOLS}/cmd/gorename && go install
	cd ${GOTOOLS}/cmd/godoc && go install
	cd ${GOTOOLS}/cmd/gopls && go install

guru:
	cd ${GOTOOLS}/cmd/guru && go install

gocode:
	go get -u -v github.com/mdempsky/gocode

protobuf:
	go get -u -v github.com/golang/protobuf/protoc-gen-go
	go get -u -v github.com/micro/protoc-gen-micro

govendor:
	go get -u -v github.com/kardianos/govendor

gomockgen:
	go get -u -v github.com/golang/mock/mockgen

gopkgs:
	go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs

go-outline:
	go get -u -v github.com/ramya-rao-a/go-outline

go-symbols:
	go get -u -v github.com/acroca/go-symbols





