#
# Cookbook Name:: roles
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


git "/tmp/chef-repo" do
  repository "git@github.com:vnaboychenko/chef-repo.git"
  revision "29bf57026377d5f18dc5605cc3cdf2cdeb911cfa"
  action :sync
end

