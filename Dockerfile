FROM telegrammessenger/mtproxy:latest

# Укажите порт
EXPOSE 8888

# Запуск прокси
CMD ["-u", "nobody", "-p", "8888", "-H", "443", "--secret", "0123456789abcdef0123456789abcdef"]
