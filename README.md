# singbox

1. Установить Docker
2. Зайти в корень проекта
3. Создать файлы `.env` и `.env.ru`, заполнить их по образцу `.env.example`
4. Выполнить в командной строке `docker compose up -d --build`
5. В клиенте настроить проксирование через `socks5://127.0.0.1:10808` (`10809` для второго контейнера), например
    - Chrome
        - установить расширение https://chromewebstore.google.com/detail/proxy-switchyomega-3-zero/pfnededegaaopdmhkdmcofjmoldfiped?hl=en
        - создать новый профиль, настроить роуты (указать протокол socks5, сервер 127.0.0.1, порт 10808 или 10809), сохранить изменения
    - Firefox
        - settings -> network settings -> Automatic proxy configuration URL -> указать там путь для `routing.pac`
        - включить чекбокс "Proxy DNS when using SOCKS v5"
    - Bash (в пределах сессии, подходит также для wsl)
        - ```
          export ALL_PROXY="socks5://127.0.0.1:10808"
          export HTTP_PROXY="socks5://127.0.0.1:10808"
          export HTTPS_PROXY="socks5://127.0.0.1:10808"
          ```
    - Powershell (в пределах сессии)
        - ```
          setx HTTP_PROXY  "socks5://127.0.0.1:10808"
          setx HTTPS_PROXY "socks5://127.0.0.1:10808"
          setx ALL_PROXY   "socks5://127.0.0.1:10808"
          ```
    - JetBrains
        - File → Settings → System Settings → HTTP Proxy
        - Manual proxy configuration, HTTP: 127.0.0.1, Port: 3129 
6. Проверить, что нет утечек (не должно быть местных серверов)
    - https://browserleaks.com/dns
    - https://ipleak.net
7. Проверить IP адреса, например на 2ip.io и 2ip.ru