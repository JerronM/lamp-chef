apt_update 'daily' do
  frequency 86400
  action :periodic
end

include_recipe 'lamp::apache'
include_recipe 'lamp::mysql'
include_recipe 'lamp::php'