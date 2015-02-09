#
# Cookbook Name:: cassandra
# Recipe:: init
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "ntp" do
	action :install
end


service "ntpd" do
  supports :restart => true, :reload => true
  action :start
end

service "ntpd" do
  supports :restart => true, :reload => true
  action :enable
end

group "cassandra" do
  action :create
end

user "cassandra" do
#  supports :manage_home => true
  comment "Cassandra User"
#  uid 1234
  gid "cassandra"
  shell "/bin/bash"
end


#directory "/var/log/cassandra" do
#  owner   "cassandra"
#  group   "cassandra"
#  action :create
#end


%w{/var/log/cassandra /opt/storage/ /opt/storage/cassandra /opt/storage/cassandra/data /opt/storage/cassandra/saved_caches /opt/storage/cassandra/commitlog}.each do |cassandra_dirs|
  directory cassandra_dirs do
    owner   "cassandra"
    group   "cassandra"
    action :create
  end
end



