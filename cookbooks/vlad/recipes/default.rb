#
# Cookbook Name:: vlad
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#::Chef::Recipe.send(:include, Opscode::Ntp::Helper)
include_recipe 'ntp'



leapfile_enabled = "Vlad"

service "ssh" do
action :nothing
end


begin
  r = resources(:template => "#{node['ntp']['conffile']}")
  r.cookbook "vlad"
  r.notifies :restart, "service[ssh]"
#  r.variables(:ntpd_supports_native_leapfiles => leapfile_enabled)
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "could not find template to override!"
end

#template node['ntp']['conffile'] do
#  source   'ntp.conf.erb'
#  owner    node['ntp']['conf_owner']
#  group    node['ntp']['conf_group']
#  mode     '0644'
#  notifies :restart, "service[#{node['ntp']['service']}]"
#end

