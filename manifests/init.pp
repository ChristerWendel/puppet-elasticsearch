# == Class: elasticsearch
#
# A module for Elasticsearch [http://elastic.co]
#
# === Parameters
# ["version"]
#   The package version to install
#
# ["enable"]
#   Should the service be enabled during boot time?
#
# ["start"]
#   Should the service be started by Puppet?

class elasticsearch (
  $version = 'present',
  $enable = true,
  $start = true
  )  {
    class{'elasticsearch::install': } ->
    class{'elasticsearch::configure': } ~>
    class{'elasticsearch::service': } ->
    Class['elasticsearch']
  }
