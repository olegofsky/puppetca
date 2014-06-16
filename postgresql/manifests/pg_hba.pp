class postgresql::pg_hba (
  $values = [],
  $require_file = "/etc/postgresql/9.1/main/pg_hba.conf",
) inherits postgresql::control { 

  Exec [ "pg_ctl_reload"] {
    onlyif => '/usr/bin/test -e ${require_file}',
  }

  file { "${require_file}":
    ensure  => present,
    content => template('postgresql/pg_hba.erb'),
    mode    => 0640,
    owner   => 'postgres',
    group   => 'postgres',
    require => Package["postgresql-9.1"],
    notify  => Exec["pg_ctl_reload"]
  }

}

