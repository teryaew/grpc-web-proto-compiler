FROM debian
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install unzip && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v3.8.0/protoc-3.8.0-linux-x86_64.zip -O protoc.zip
RUN mkdir /protoc
RUN unzip protoc.zip -d /usr/local bin/protoc
RUN unzip protoc.zip -d /usr/local include/*
RUN chmod 777 /usr/local/bin/protoc

RUN wget https://github.com/grpc/grpc-web/releases/download/1.0.4/protoc-gen-grpc-web-1.0.4-linux-x86_64 -O protoc-gen-grpc-web
RUN mv protoc-gen-grpc-web /usr/local/bin/protoc-gen-grpc-web
RUN chmod 777 /usr/local/bin/protoc-gen-grpc-web

ENV JS_OUT_IMPORT_STYLE=commonjs
ENV GRPC_WEB_OUT_IMPORT_STYLE=commonjs+dts
ENV GRPC_OUT_MODE=grpcwebtext
ENV OUTPUT=/proto/generated
VOLUME /proto

CMD rm -rf $OUTPUT && \
    mkdir $OUTPUT && \
    /usr/local/bin/protoc \
    /proto/*.proto \
    --proto_path=/proto \
    --js_out=import_style=$JS_OUT_IMPORT_STYLE:$OUTPUT \
    --grpc-web_out=import_style=$GRPC_WEB_OUT_IMPORT_STYLE,mode=$GRPC_OUT_MODE:$OUTPUT