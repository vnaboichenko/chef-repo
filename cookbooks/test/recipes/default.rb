#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#package "emacs" do
#  action :install
#end

#%w{ntp mc htop iotop iftop atop vim-common wget curl rkhunter git awstats postfix}.each do |packages|
#    package packages do
#    action :install
#    end
#end


package "nginx" do
	action :install
end

ip_addr = 'test123'

file "/tmp/something" do
  owner   "root"
  group   "root"
  mode    "755"
  content "#{node[:var]}"
#  content "#{node[:ipaddress]}"
  action :create
  notifies :reload, "service[nginx]", :immediately
end

service "nginx" do
  supports :restart => true, :reload => true
  action :start
end

service "nginx" do
  supports :restart => true, :reload => true
  action :enable
end
