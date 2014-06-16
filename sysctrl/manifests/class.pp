cass sysctl (
  $purge = false,
) {

  if $purge {
    $recurse = true
  } else {
    $recurse = false
  }

  file { '/tmp/sysctl.test':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755',
# Magic hidden here
    purge => $purge,
    recurse => $recurse,
  }

}
