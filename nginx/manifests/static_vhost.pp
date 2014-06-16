define nginx::static_vhost (
  $server_name = undef,
  $listen = ["80"],
  ){

  file { 'vhost.conf':
    ensure  => present,
    path    => "/etc/nginx/sites-enabled/${server_name}",
    content => template("nginx/static_vhost.erb"),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => Exec["apple_changes"]
  }
}
