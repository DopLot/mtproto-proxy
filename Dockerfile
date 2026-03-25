FROM alpine:latest

RUN apk add --no-cache wget curl

# Скачиваем готовый бинарник MTProto
RUN wget -O /usr/local/bin/mtproto-proxy https://github.com/alexbers/mtproxy-docker/releases/download/v1.0.9/mtproto-proxy-linux-amd64 && \
    chmod +x /usr/local/bin/mtproto-proxy

EXPOSE 8888

# Генерируем секрет и запускаем
CMD mtproto-proxy -u nobody -p 8888 -H 443 --secret a7f3e9b1d4c82056a1b9e4c7d2f8a6b3
