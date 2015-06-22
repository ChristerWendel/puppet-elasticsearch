# == Class: elasticsearch::install
#
# Installs elasticsearch
class elasticsearch::install {
  include aptrepo

  if $::architecture == 'amd64' or $::architecture == 'i386' {
    aptrepo::addrepo { 'elasticsearch':
      location => 'http://packages.elasticsearch.org/elasticsearch/1.6/debian/',
      key      => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch',
      } -> Package['elasticsearch']
  }

  package { 'elasticsearch':
    ensure => $elasticsearch::version,
  }
}
