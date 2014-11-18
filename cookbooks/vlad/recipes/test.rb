#
# Cookbook Name:: vlad
# Recipe:: test
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#::Chef::Recipe.send(:include, Opscode::Ntp::Helper)
include_recipe 'ntp'


begin
#  r = resources(:template => "#{node['ntp']['conffile']}")
#  r.cookbook "vlad"
rescue Chef::Exceptions::ResourceNotFound
#  Chef::Log.warn "could not find template to override!"
end

#template node['ntp']['conffile'] do
#  source   'ntp.conf.erb'
#  owner    node['ntp']['conf_owner']
#  group    node['ntp']['conf_group']
#  mode     '0644'
#  notifies :restart, "service[#{node['ntp']['service']}]"
#end

