class nginx (

  $gzip = 'on',
  $gzip_disable = 'msie6',
  $worker_processes    = 4,
  $worker_connections  = '1024',
  $multi_accept        = 'off',
  $server_names_hash_bucket_size = '64',
  $server_name_in_redirect = 'off',
  $types_hash_max_size = '1024',
  $sendfile    = 'on',
  $tcp_nopush  = 'on',
  $tcp_nodelay = 'on',
  $directio    = 'off',
  $keepalive_timeout   = '65',
  $types_hash_max_size = '2048',
  $server_tokens       = 'off',

){
  package { 'nginx-full':
    ensure => latest,
    name   => 'nginx-full',
  }

  service { "puppet":
    enable  => true,
    require => Package['nginx-full'],
  }

  file { 'nginx.conf':
    ensure  => file,
    path    => '/etc/nginx/nginx.conf',
    content => template("nginx/nginx.conf.erb"),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Package['nginx-full'],
    notify  => Exec["apple_changes"]
  }

   exec { "apple_changes":
     command     => '/etc/init.d/nginx reload',
     refreshonly => true,
   }
}

