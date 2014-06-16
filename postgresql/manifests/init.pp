class postgresql {
  package { "postgresql-9.1": ensure => "installed", }

  service {'postgresql':
    enable     => true,
    ensure     => running,
    hasstatus  => false,
    hasrestart => false,
    require    => Package["postgresql-9.1"],
  }
}

