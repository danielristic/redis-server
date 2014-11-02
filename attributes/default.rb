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
