define nginx::upstream (
  $ensure      = 'present',
  $ip_hash     = undef,
  $keepalive   = undef,
  $members     = [],
  ){

  file { 'upstream.conf':
    ensure  => present,
    path    => "/etc/nginx/sites-enabled/${name}",
    content => template("nginx/upstream.erb"),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => Exec["apple_changes"]
  }
}

