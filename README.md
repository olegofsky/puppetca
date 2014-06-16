puppetca
========

puppet manifests

quick start
===========

class { 'sysadmin-tools': }



sysctrl { "puppet.control":
  values => ["kernel.ctrl-alt-del = 1",
            "net.ipv4.ip_local_port_range = 32767    61000"] }



class { 'postgresql': }

class { "postgresql::pg_hba":
  values => [ "local all postgres peer",
            "host all postgres 192.168.1.119/32 trust",]}

class { 'postgresql::pg_config':
  params => ["ssl = false", ]}



class { 'nginx': 
        worker_processes => '1'}

nginx::static_vhost { 'test.ru':
  server_name => 'test.ru',
  listen => ["192.168.1.130:9091", "443"]}

nginx::php_vhost { 'php.test':
  server_name => "php.test",
  listen => ["80", "192.168.1.130:8008"],
  fastcgi_pass => "127.0.0.1:9000",
  root_path => "/tmp/test/asdasd/" }

nginx::upstream { 'ropewalker':
  members => ["127.0.0.1:8085 max_fails=3 fail_timeout=30s",
  "127.0.0.1:8086",
  "127.0.0.1:8087",
  "192.168.1.130:8008 max_fails=3 fail_timeout=10s"],
  ip_hash => true}
