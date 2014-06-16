class postgresql::pg_config (
  $params = [],
  $require_file = "/etc/postgresql/9.1/main/postgresql.conf",
  ) inherits postgresql::control {

  Exec [ "pg_ctl_reload"] {
    require +> [File[$require_file]],
  }
  file { "postgresql.conf":
    ensure  => present,
    path    => "${require_file}",
    content => template("postgresql/postgresql.conf.erb"),
    mode    => '0644',
    owner   => 'postgres',
    group   => 'postgres',
    notify  => Exec["pg_ctl_reload"]
  }
}

