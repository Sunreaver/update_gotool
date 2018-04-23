ROOT=${GOPATH}src/golang.org/x
GOLINT=$(ROOT)/lint
GOIMPORTS=$(ROOT)/tools

.PHONY: golint
.PHONY: goimports
.PHONY: protobuf
.PHONY: gocode
.PHONY: godep
.PHONY: goconvey
.PHONY: gomockgen
.PHONY: goimportdot

update: goimports golint gocode protobuf godep goconvey gomockgen goimportdot

install:
	cd $(ROOT) && git clone https://github.com/golang/lint
	cd $(ROOT) && git clone https://github.com/golang/tools

golint:
	cd $(GOLINT) && git pull && cd $(GOLINT)/golint && go install

goimports:
	cd $(GOIMPORTS) && git pull && cd $(GOIMPORTS)/cmd/goimports && go install

gocode:
	go get -u -v github.com/nsf/gocode

protobuf:
	go get -u -v github.com/golang/protobuf/protoc-gen-go

godep:
	go get -u -v github.com/tools/godep

goconvey:
	go get -u -v github.com/smartystreets/goconvey

gomockgen:
	go get -u -v github.com/golang/mock/mockgen

goimportdot:
	go get -v -u github.com/yqylovy/goimportdot

