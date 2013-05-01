#
# Cookbook Name:: postgres-db-master
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "wget"

execute "get pg key" do
  command 'wget -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -'
end

#TODO - fix this for correct lsb release, or at least most applicable lts
execute "add repository" do
  command 'echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
end

cookbook_file "/etc/apt/preferences.d/pgdg.pref" do
  source "pg-pref"
end

execute "apt-get update" 
execute "sudo apt-get install pgdg-keyring"
