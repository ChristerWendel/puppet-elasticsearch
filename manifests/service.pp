# == Class: elasticsearch::service
#
# Controls the elasticsearch service
class elasticsearch::service {
  $ensure = $elasticsearch::start ? {true => running, default => stopped}

  service { 'elasticsearch':
    ensure => $ensure,
    enable => $elasticsearch::enable,
  }
}
