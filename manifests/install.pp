# == Class: elasticsearch::install
#
# Installs elasticsearch
class elasticsearch::install {
  include aptrepo

  aptrepo::addrepo { 'elasticsearch':
    location => 'http://packages.elasticsearch.org/elasticsearch/1.4/debian/',
    key      => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch',
  } -> Package['elasticsearch']

  package { 'elasticsearch':
    ensure => $elasticsearch::version,
  }
}
