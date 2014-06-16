define nginx::php_vhost (
  $server_name  = undef,
  $listen       = ["80"],
  $fastcgi_pass = undef,
  $root_path    = undef,
  $static_path  = $root_path,
  ){

  file { 'php_vhost.conf':
    ensure  => present,
    path    => "/etc/nginx/sites-enabled/${server_name}",
    content => template("nginx/php_vhost.erb"),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => Exec["apple_changes"],
  }
}
