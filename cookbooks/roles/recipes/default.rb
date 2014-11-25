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


node.override['revision'] = revision


#if /\A(([0-9a-f]{40})|([0-9a-f]{6,8}))\z/.match("#{revision}")
#    branch_name = "deploy"
#  else 
#    branch_name = revision
#end


if defined? node['revisionn'] || node['revisionn'] == nil

Chef::Log.info("NOT DEFINED")

return "TEST"
#return "#{node["chef-repo"]["git_ref"]} is not defined in #{cookbook_name}::#{recipe_name} recipe"

end

#if 
#return "#{node["chef-repo"]["git_ref"]} is not defined in #{cookbook_name}::#{recipe_name} recipe"
#end

gem_package 'bundler'

git "/tmp/#{repo_name}"  do
  repository repo_url
  name "sync chef-repo" 
#  checkout_branch branch_name
  reference revision
#  notifies :run, 'execute[upload roles]', :immediately
  action :sync
end

execute "upload roles" do
  cwd "/tmp/#{repo_name}"
  command "knife upload roles --chef-repo-path /tmp/#{repo_name}"
  subscribes :run, "git[sync chef-repo]", :immediately
  action :nothing
end

execute "echo 1 >> /tmp/1" do
  subscribes :run, "git[sync chef-repo]", :immediately
  action :nothing
end

