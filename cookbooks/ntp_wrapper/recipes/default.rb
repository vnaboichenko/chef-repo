#
# Cookbook Name:: ntp_wrapper
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


include_recipe 'ntp'


begin
  r = resources(:template => "#{node['ntp']['conffile']}")
  r.cookbook "ntp_wrapper"
  r.notifies :restart, "service[#{node['ntp']['service']}]"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "could not find template to override!"
end

