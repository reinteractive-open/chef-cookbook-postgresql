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
    end
  end
end
