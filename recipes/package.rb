#
# Cookbook Name:: postgres-db-master
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "add-apt-repository ppa:pitti/postgresql" do
end
execute "apt-get update" do
end
package "postgresql-9.2"
package "postgresql-client-9.2"
package "postgresql-contrib-9.2"
package "xfsprogs"
