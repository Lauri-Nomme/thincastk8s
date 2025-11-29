#!/bin/sh
if [ "$OUTBOUND_CONFINE" ]; then
  iptables -P OUTPUT DROP
  iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
  iptables -A OUTPUT -o lo -j ACCEPT
  echo "[+] OUTBOUND CONFINED"
  if [ -n "$OUTBOUND_WHITELIST" ]; then
    for i in $OUTBOUND_WHITELIST; do
      iptables -A OUTPUT -d "$i" -j ACCEPT
      echo "[+] OUTBOUND WHITELIST ${i}"
    done
  fi
fi
b="$1"
shift
echo "[+] $b" "$@"
exec "$b" "$@"
