#
# Cookbook:: filecreat4
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
iis_site 'Default Web Site' do
  action [:stop, :delete]
end
directory "#{node['iis']['docroot']}/testfu" do
  action :create
end
iis_site 'Testfu Site' do
  protocol :http
  port 80
  path "#{node['iis']['docroot']}/testfu"
  action [:add,:start]
end

include_recipe 'iis'
