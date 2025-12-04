function FindProxyForURL(url, host) {
    // if (host == null || host === "")
    //     return "SOCKS5 127.0.0.1:10808";

    // //    Uncomment this to work with localhost, BUT DNS LEAKS ARE POSSIBLE
    // // 1) Don't proxy localhost / LAN.
    // if (isPlainHostName(host) ||
    //     shExpMatch(host, "127.0.0.1") ||
    //     isInNet(host, "192.168.0.0", "255.255.0.0")) {
    //     return "DIRECT";
    // }

    // 2) All .ru domains through SOCKS on 10809
    if (dnsDomainIs(host, ".ru")) {
        return "SOCKS5 127.0.0.1:10809";
    }

    // 3) Everything else through SOCKS on 10808
    return "SOCKS5 127.0.0.1:10808";
}
