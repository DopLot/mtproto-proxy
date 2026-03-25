FROM telegrammessenger/mtproxy:latest

EXPOSE 8888

CMD ["-u", "nobody", "-p", "8888", "-H", "443", "--secret", "a7f3e9b1d4c82056a1b9e4c7d2f8a6b3"]
