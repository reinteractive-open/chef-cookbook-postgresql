#
# Cookbook Name:: postgres-db-master
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package wget do;end

execute "get pg key" do
  wget -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
end

#TODO - fix this for correct lsb release
execute "add repository" do
  command 'echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main"'
end

execute "pin version" do
  read -r -d '' PIN << EOF
  Package: *
  Pin: release o=apt.postgresql.org
  Pin-Priority: 500
  EOF
  echo $PIN > /etc/apt/preferences.d/pgdg.pref
end

execute "apt-get update" do;end
execute "sudo apt-get install pgdg-keyring"

package "postgresql-9.2"
package "postgresql-client-9.2"
package "postgresql-contrib-9.2"
package "xfsprogs"
