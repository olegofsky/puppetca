puppetca
========

puppet manifests

quick start

class { 'sysadmin-tools': }


sysctrl { "puppet.control": values => [
  "kernel.ctrl-alt-del = 1",
  "net.ipv4.ip_local_port_range = 32767    61000"] }

class { 'postgresql': }

class { "postgresql::pg_hba": values => [
  "local all postgres peer", 
  "host all postgres 192.168.1.119/32 trust",]}
         
class { 'postgresql::pg_config': params => [ 
  "ssl = false", ]}

