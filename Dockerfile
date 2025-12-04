FROM alpine:latest

# Устанавливаем зависимости
RUN apk add --no-cache curl ca-certificates tar tzdata iproute2 gettext

# Скачиваем и распаковываем релиз
RUN curl -L -o /tmp/singbox.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.11.15/sing-box-1.11.15-linux-amd64.tar.gz \
    && tar -xzvf /tmp/singbox.tar.gz -C /tmp \
    && ls /tmp \
    && mv /tmp/sing-box-1.11.15-linux-amd64/sing-box /usr/local/bin/sing-box \
    && chmod +x /usr/local/bin/sing-box

# Копируем конфиг
COPY config.template.json /etc/sing-box/config.template.json
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]