#!/usr/sbin/setkey -f

flush;
spdflush;
# AH
add 10.0.0.1 10.0.3.2 ah 15700 -A hmac-md5 "1234567890123456";
add 10.0.3.2 10.0.0.1 ah 24500 -A hmac-md5 "1234567890123456";
# ESP
add 10.0.0.1 10.0.3.2 esp 15701 -E 3des-cbc "123456789012123456789012";
add 10.0.3.2 10.0.0.1 esp 24501 -E 3des-cbc "123456789012123456789012";

spdadd 10.0.3.2 10.0.0.1 any -P out ipsec
	esp/transport//require
	ah/transport//require;
spdadd 10.0.0.1 10.0.3.2 any -P in ipsec
	esp/transport//require
	ah/transport//require;