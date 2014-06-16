define sysctrl (
  $values = undef,
  $ensure = undef
){
  $sysctl_d_file = "${title}.conf"

  if $ensure != "absent" {

    file { "/etc/sysctl.d/${sysctl_d_file}":
      ensure  => $ensure,
      content => template('sysctrl/sysctrl.d.erb'),
      mode    => 0644,
      owner   => 'root',
      group   => 'root',
      notify  => Exec["sysctl_load_settings"]
    }

    exec { "sysctl_load_settings":
      command     => "/sbin/sysctl -p /etc/sysctl.d/${sysctl_d_file}",
      refreshonly => true,
      require     => File["/etc/sysctl.d/${sysctl_d_file}"],
    }
  } else {

    file { "/etc/sysctl.d/${sysctl_d_file}":
      ensure => $ensure
    }

  }
}

