FROM ubuntu:22.04

RUN apt-get update && apt-get install -y wget curl && rm -rf /var/lib/apt/lists/*

# Скачиваем MTProto прямо из исходников Telegram
RUN wget -q -O /usr/local/bin/mtproto-proxy \
    https://github.com/TelegramMessenger/MTProxy/releases/download/v1.4.14/mtproto-proxy-1.4.14-linux-amd64 && \
    chmod +x /usr/local/bin/mtproto-proxy

EXPOSE 8888

CMD ["/usr/local/bin/mtproto-proxy", "-u", "nobody", "-p", "8888", "-H", "443", "--secret", "a7f3e9b1d4c82056a1b9e4c7d2f8a6b3"]
