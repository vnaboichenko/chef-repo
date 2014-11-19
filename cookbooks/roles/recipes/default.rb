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

#if /\A(([0-9a-f]{40})|([0-9a-f]{6,8}))\z/.match("#{revision}")
#    branch_name = "deploy"
#  else 
#    branch_name = revision
#end


git "/tmp/#{repo_name}" do
  repository repo_url
#  checkout_branch branch_name
  revision revision
  notifies :run, 'execute[upload roles]', :immediately
  action :sync
end

execute "upload roles" do
  cwd "/tmp/#{repo_name}"
  command "knife upload roles --chef-repo-path /tmp/#{repo_name}"
  action :nothing
end

