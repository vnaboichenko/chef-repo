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
revision  = "ccpdev"
checkout_branch = revision

git "/tmp/#{repo_name}" do
  repository repo_url
  checkout_branch checkout_branch
  revision revision
  action :sync
end

