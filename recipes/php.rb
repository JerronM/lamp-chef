node.override['php']['install_method'] = node[:lamp][:php][:install_method]

include_recipe 'php'

node[:lamp][:php_modules].each do |mod|
  include_recipe "php::module_#{mod}"
end

template '/etc/php5/mods-available/apc.ini' do
  source 'apc.ini.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[apache2]' if node.recipes.include?('apache2')
  only_if { node[:lamp][:php_modules].include?('apc') }
end
