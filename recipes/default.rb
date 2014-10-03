#
# Cookbook Name:: redis-server
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash 'Adding Redis PPA and Installing Package' do
  user 'root'
  code <<-EOC
    apt-get install -y python-software-properties
    add-apt-repository -y ppa:chris-lea/redis-server
    apt-get update
    apt-get install -y redis-server
  EOC
end

bash 'Removing existing redis-server config file and adding new one' do
  user 'root'
  code <<-EOC
    rm /etc/redis/redis.conf
    cat > /etc/redis/redis.conf <<EOF
    daemonize yes
    pidfile /var/run/redis/redis-server.pid
    logfile /var/log/redis/redis-server.log

    port 6379
      bind 127.0.0.1
    timeout 300

    loglevel notice

    databases 16

    save 900 1
    save 300 10
    save 60 10000

    rdbcompression yes
    dbfilename dump.rdb

    dir /etc/redis/
    appendonly no

    maxmemory 419430400
    maxmemory-policy allkeys-lru

    maxmemory-samples 10
EOF
    chown -R redis:redis /etc/redis
  EOC
end

bash 'Restarting Redis' do
  user 'root'
  code <<-EOC
    /etc/init.d/redis-server restart
  EOC
end
