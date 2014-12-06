redis-server Cookbook
=====================
A Cookbook for managing the installation of Redis, the Open Source Key Value Store (<http://redis.io/>).


Requirements
------------
Ubuntu 12.04 or Higher. Requires the `apt` cookbook for adding PPA's.

Attributes
----------
Available attributes and their default values:

```
default['redis-server']['appendonly'] = 'no'
default['redis-server']['additional_configuration_values'] = {}
default['redis-server']['bind'] = '127.0.0.1'
default['redis-server']['daemonize'] = 'yes'
default['redis-server']['databases'] = 16
default['redis-server']['dbfilename'] = 'dump.rdb'
default['redis-server']['dir'] = '/etc/redis/'
default['redis-server']['logfile'] = '/var/log/redis/redis-server.log'
default['redis-server']['loglevel'] = 'notice'
default['redis-server']['package'] = 'redis-server'
default['redis-server']['pidfile'] = '/var/run/redis/redis-server.pid'
default['redis-server']['port'] = '6379'
default['redis-server']['ppa'] = 'ppa:chris-lea/redis-server'
default['redis-server']['rdbcompression'] = 'yes'
default['redis-server']['save'] = [
  '900 1',
  '300 10',
  '60 10000'
]
default['redis-server']['timeout'] = 300
```

There is also an additional attribute `additional_configuration_values` which accepts a hash to allow the addition of arbitrary key value pairs to the configuration file. For example setting `additional_configuration_values` to the following:

```
{
  'maxmemory' => 419430400,
  'maxmemory-policy' => 'allkeys-lru',
  'maxmemory-samples' => '10'
}
```

Would result in the following configuration file entries:

```
maxmemory 419430400
maxmemory-policy allkeys-lru
maxmemory-samples 10
```

Usage
-----
#### redis-server::default
Simply include the recipe in the nodes `run_list`.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[redis-server]"
  ]
}
```
