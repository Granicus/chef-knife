#
# Cookbook Name:: chef_repo
# Recipe:: default
#
# Copyright 2014, Granicus Inc.
#
# All rights reserved - Do Not Redistribute
#

Chef::Recipe:;APPLICATION_NAME = 'chef_repo'

include_recipe 'granicus'
include_recipe 'application'
include_recipe 'git'
include_recipe 'hipchat'

application Chef::Recipe::APPLICATION_NAME do
  path application_path
  repository 'git@github.com:Granicus/chef_repo.git'
  revision 'master'
  deploy_key granicus_deploy_key
  environment 'PATH_PREFIX' => ::File.join(ruby_path_prefix, 'bin')

  after_restart do
    ruby_block 'setup chef_repo for use' do
      not_if { ::File.exists?(::File.join(application_path, '.chef')) }
      block do
        ::Fil
      end
    end

    hipchat_msg 'deployed' do
      room node[:hipchat][:room]
      token node[:hipchat][:token]
      nickname 'Chef'
      message "Success on \"#{node.name}\": deployed #{ProcfileHelpers.instance.current_release}"
      color 'green'
    end
  end
end
