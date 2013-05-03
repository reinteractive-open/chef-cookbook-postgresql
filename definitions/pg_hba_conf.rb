define :pg_hba_conf, :entries => {} do
  #Engries needs to be:
  # [ { "ip" => ip, "username" => username, "auth_method" => auth_method, "database" => database}]
  #TODO: um, this isn't ok, discover this not hard code it
  
  entries = params[:entries] 
  template "/etc/postgresql/9.2/main/pg_hba.conf" do
    source "pg_hba.conf.erb"
    owner  "postgres"
    group  "postgres"
    variables({
      :entries => entries
    )}
  end
end
