class postgresql::control {
  exec { "pg_ctl_reload":
    command     => "/etc/init.d/postgresql reload",
    require     => Package['postgresql-9.1'],
    refreshonly => true
  }
}
