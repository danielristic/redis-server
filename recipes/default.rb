#
# Cookbook Name:: redis-server
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

apt_repository 'redis-server' do
  uri          'ppa:chris-lea/redis-server'
  distribution node['lsb']['codename']
end

package "redis-server"

template "/etc/redis/redis.conf" do
  owner "redis"
  group "redis"
  mode "0644"
  source "redis.conf.erb"
  notifies :run, "execute[restart-redis]", :immediately
end

directory "/etc/redis" do
  owner 'redis'
  group 'redis'
  action :create
end

execute "restart-redis" do
  command "/etc/init.d/redis-server restart"
  action :nothing
end
