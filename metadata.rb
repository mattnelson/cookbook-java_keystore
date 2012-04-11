maintainer       "Salsa Labs, Inc."
maintainer_email "cookbooks@salsalabs.com"
license          "Apache 2.0"
description      "Generates a java keystore file"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.3"

%w{ java }.each do |cb|
  depends cb
end

%w{ debian ubuntu mac_os_x }.each do |os|
  supports os
end

recipe "java_keystore::default", "Generate a java keystore"
