# gRPC Web Proto Compiler

Want to generate some gRPC-Web stubs without installing & tuning proto compiler binaries locally by hands or on your CI? Grab this, man.

Packaging right now only via Docker.

## Installing

#### Docker Hub

```
docker pull teryaew/grpc-web-proto-compiler
```

#### Build from sources

```
git clone git@github.com:teryaew/grpc-web-proto-compiler.git
cd grpc-web-proto-compiler
docker build . -t teryaew/grpc-web-proto-compiler
```

## Running

`docker run --volume=<YOUR_PROTO_DIR>:/proto teryaew/protoc-grpc-web`

Stubs will be generated in `<YOUR_PROTO_DIR>/generated`.

## Environment variables

You can pass some envvars into your container runtime:

#### JS_OUT_IMPORT_STYLE

Default: `commonjs`

#### GRPC_WEB_OUT_IMPORT_STYLE

Default: `commonjs+dts`

Pure typescript import style is too much experimental right now (June 2019), prefer use `commonjs+dts` instead.

#### GRPC_OUT_MODE

Default: `grpcwebtext`
