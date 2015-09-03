include_recipe "git"
include_recipe "nodejs::nodejs_from_binary"
include_recipe "df_node_fix"


execute "re run chown on affected directories" do 
    command "chown -R vagrant:vagrant ~/.nvm && chown -R vagrant:vagrant /usr/local && chown -R vagrant:vagrant ~/npm-global"
    action :run
end

execute "prepare polymer dependencies" do 
    group "vagrant"
    user "vagrant"
    command "npm install -g yo bower grunt-cli gulp generator-polymer"
    action :run
end