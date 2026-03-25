FROM alpine:3.18

RUN apk add --no-cache ca-certificates curl

# Скачиваем MTProto-прокси через официальный репозиторий
# Используем архив от alexbers (проверенный)
RUN wget -q -O /usr/local/bin/mtproto-proxy https://github.com/alexbers/mtprotoproxy/releases/download/v1.0.9/mtproto-proxy-linux-amd64 && \
    chmod +x /usr/local/bin/mtproto-proxy

EXPOSE 8888

CMD ["/usr/local/bin/mtproto-proxy", "-u", "nobody", "-p", "8888", "-H", "443", "--secret", "a7f3e9b1d4c82056a1b9e4c7d2f8a6b3"]
