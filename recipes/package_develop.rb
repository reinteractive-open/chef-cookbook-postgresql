#
# Cookbook Name:: postgres-db-master
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "postgresql::package_repository"

package "postgresql-server-dev-all"
