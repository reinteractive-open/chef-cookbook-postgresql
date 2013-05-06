#
# Cookbook Name:: postgres-db-master
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
users = data_bag("users")

users.each do |user_bag|
  user = data_bag_item("users",user_bag)
  uname = user['id']
  if user['is_db_owner']
    execute "create postgres user" do
      user "postgres"
      command "createuser #{uname} --createdb --echo --login --superuser --replication"
      only_if "test -z $(psql -t -c 'select usename from pg_catalog.pg_user;'|grep #{uname})", :user => 'postgres'
    end
    password = user.fetch("db_password")
    if password
      execute "create password for user" do
        user "postgres"
        command "psql -c 'alter user #{uname} password \'#{password}\''"
        only_if "test -n $(psql -t -c 'select usename from pg_catalog.pg_user;'|grep #{uname})", :user => 'postgres'
      end
    end
  end
end
