
#  -------    CHEF-ARM-A15-LINUX-SAMPLE --------

# LICENSETEXT
# 
#   Copyright (C) 2013 : GreenSocs Ltd
#       http://www.greensocs.com/ , email: info@greensocs.com
# 
# The contents of this file are subject to the licensing terms specified
# in the file LICENSE. Please consult this file for restrictions and
# limitations that may apply.
# 
# ENDLICENSETEXT

#The project is in /vagrant/GSDEMO/eclipse

bash "Download precompiled Sample Linux Image" do
  code <<-EOH
    if [ ! -e #{node[:prefix]}/GSDEMO/zImage ]; then
        mkdir -p #{node[:prefix]}/GSDEMO
        cd #{node[:prefix]}/GSDEMO
        wget http://www.greensocs.com/files/gsdemo.tar.gz
        tar -xf gsdemo.tar.gz
        rm gsdemo.tar.gz
    fi
  EOH
  environment ({ 'http_proxy' => Chef::Config[:http_proxy] })
end

bash "Download the Eclipse project." do
  code <<-EOH
    if [ ! -e "#{node[:prefix]}/GSDEMO/eclipse" ]; then
        cd #{node[:prefix]}/GSDEMO
        wget http://www.greensocs.com/files/gsdemo_eclipse.tar.gz
        tar -xf gsdemo_eclipse.tar.gz
        rm gsdemo_eclipse.tar.gz
    fi
  EOH
  environment ({ 'http_proxy' => Chef::Config[:http_proxy] })
end

bash "Download the ARM toolchain." do
  code <<-EOH
    cd #{node[:prefix]}/GSDEMO
    if [ ! -e "#{node[:prefix]}/GSDEMO/arm-2012.03" ]; then
    wget http://www.greensocs.com/files/arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
    tar -xf arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
    rm arm-2012.03-57-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
    fi
  EOH
  environment ({ 'http_proxy' => Chef::Config[:http_proxy] })
end

bash "Download the Kernel sources." do
  code <<-EOH
    cd #{node[:prefix]}/GSDEMO
    if [ ! -e "#{node[:prefix]}/GSDEMO/linux-demo" ]; then
    wget http://www.greensocs.com/files/linux-demo.tar.bz2
    tar -xf linux-demo.tar.bz2
    rm linux-demo.tar.bz2
    fi
  EOH
  environment ({ 'http_proxy' => Chef::Config[:http_proxy] })
end

bash "Create the hostshare." do
  code <<-EOH
    cd #{node[:prefix]}/GSDEMO
    if [ ! -e "#{node[:prefix]}/GSDEMO/hostshare" ]; then
    mkdir hostshare
    cd hostshare
    echo "This is a shared directory." >> README
    echo "You can access it through the guest: /hostshare." >> README
    echo "And you can access it through the host: .../GSDEMO/hostshare." >> README
    fi
  EOH
  environment ({ 'http_proxy' => Chef::Config[:http_proxy] })
end
