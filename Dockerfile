FROM alpine:3.18

# Установка необходимых пакетов
RUN apk add --no-cache ca-certificates wget

# Скачиваем MTProto-прокси из проверенного источника (alexbers)
RUN wget -q -O /usr/local/bin/mtproto-proxy \
    https://github.com/alexbers/mtproxy-docker/releases/download/v1.0.9/mtproto-proxy-linux-amd64 && \
    chmod +x /usr/local/bin/mtproto-proxy

# Открываем порт
EXPOSE 8888

# Запуск с секретным ключом (можно заменить на свой)
CMD ["/usr/local/bin/mtproto-proxy", "-u", "nobody", "-p", "8888", "-H", "443", "--secret", "a7f3e9b1d4c82056a1b9e4c7d2f8a6b3"]
