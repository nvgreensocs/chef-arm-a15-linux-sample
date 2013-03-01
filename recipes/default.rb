
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

bash "Download precompiled Sample Linux Image" do
  code <<-EOH
    mkdir -p #{node[:prefix]}/GSDEMO
    cd #{node[:prefix]}/GSDEMO
    wget http://www.greensocs.com/files/gsdemo.tar
    tar -xf gsdemo.tar
    rm gsdemo.tar
  EOH
  environment ({ 'http_proxy' => Chef::Config[:http_proxy] })
end

#bash "Checkout the Kernel source." do
#  code <<-EOH
#    cd #{node[:prefix]}
#    mkdir ARM-A15-SAMPLE
#    cd ARM-A15-SAMPLE
#    git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
#    git reset --hard v3.8-rc7
#  EOH
#  environment ({ 'http_proxy' => Chef::Config[:http_proxy] })
#end

#bash "Apply the patch-set." do
#  code <<-EOH
#    cd #{node[:prefix]}/ARM-A15-SAMPLE/linux-stable
#    wget http://www.greensocs.com/files/kernel-patches/0001-sc-counter-add-sc-#counter-driver.patch
#    git am 0001-sc-counter-add-sc-counter-driver.patch
#  EOH
#  environment ({ 'http_proxy' => Chef::Config[:http_proxy] })
#end

#The project is in /vagrant/GSDEMO/eclipse

bash "Download the Eclipse project." do
  code <<-EOH
    cd #{node[:prefix]}/GSDEMO
    wget http://www.greensocs.com/files/gsdemo_eclipse.tar.gz
    tar -xf gsdemo_eclipse.tar.gz
    rm gsdemo_eclipse.tar.gz
  EOH
  environment ({ 'http_proxy' => Chef::Config[:http_proxy] })
end
