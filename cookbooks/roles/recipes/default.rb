#
# Cookbook Name:: roles
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


repo_name = "chef-repo"
repo_url  = "git@github.com:vnaboychenko/chef-repo.git"
revison   = "ccpdev"


git "/tmp/#{repo_name}" do
  repository repo_url
  revision revision
  action :sync
end

