#!/bin/bash

echo "[$(date -Iseconds)] Proxy traffic"
if [[ -n ${docker_network} ]]; then
  iptables -A FORWARD -o nordlynx -i eth0 -m conntrack --ctstate NEW -j ACCEPT
  iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
  iptables -t nat -A POSTROUTING -o nordlynx -j MASQUERADE
fi
