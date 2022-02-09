#!/bin/bash
yum install -y squid
yum install -y dos2unix
yum install iptables-services -y
chkconfig squid on

mv /etc/squid/squid.conf /etc/squid/squid.conf.bak
mv squid.conf /etc/squid/squid.conf

chcon system_u:object_r:squid_conf_t:s0 /etc/squid/squid.conf

iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 69 -j ACCEPT
service iptables save 
service iptables restart

service squid start
