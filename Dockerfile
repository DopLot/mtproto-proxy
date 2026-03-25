FROM alpine:3.18

RUN apk add --no-cache ca-certificates

# Копируем готовый MTProto-прокси из официального образа
# Используем многоступенчатую сборку
FROM telegrammessenger/mtproxy:latest as mtproxy

FROM alpine:3.18

RUN apk add --no-cache ca-certificates

# Копируем бинарник из официального образа
COPY --from=mtproxy /usr/local/bin/mtproto-proxy /usr/local/bin/mtproto-proxy

EXPOSE 8888

CMD ["/usr/local/bin/mtproto-proxy", "-u", "nobody", "-p", "8888", "-H", "443", "--secret", "a7f3e9b1d4c82056a1b9e4c7d2f8a6b3"]
