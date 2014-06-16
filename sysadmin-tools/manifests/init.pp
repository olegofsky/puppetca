## Ставим необходимые для работы инструменты.
#  Делаем vim редактором по умолчанию.

class sysadmin-tools {
  $enhancers = [ "vim", "dnsutils", "wget", "htop",
                 "iftop", "tmux", "traceroute" ]
  package { $enhancers: ensure => "latest" }

  exec { "vim_default_editor":
    command => "update-alternatives --set editor /usr/bin/vim.basic",
    path    => "/usr/bin/:/usr/local/bin/",
    unless  => "test /etc/alternatives/editor -ef  /usr/bin/vim.basic",
    require => Package['vim'],
  }

  file { "/etc/bash_completion.d/bash_completion_tmux.sh":
    ensure  => "present",
    require => Package['tmux'],
    mode    => 0644,
    owner   => root,
    group   => root,
    source  => "/usr/share/doc/tmux/examples/bash_completion_tmux.sh"
  }

}
