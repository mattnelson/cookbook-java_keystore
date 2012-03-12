include_recipe "java::oracle"

jks = node[:java_keystore]
node["java_keystore"]["cacerts"] = File.join(node[:java][:java_home], "jre", "lib", "security", "cacerts")

Chef::Log.info("JAVA_HOME set to #{node[:java][:java_home]}")
Chef::Log.info("cacerts set to #{node["java_keystore"]["cacerts"]}")

file jks[:path] do
	Chef::Log.info("removing #{jks[:path]}")
	action :delete
	only_if do
		FileTest.exists? jks[:path]
	end
end

execute "keytool-generate" do
	Chef::Log.info("#{jks[:alias]}")
	command <<-eos
		keytool -genkey \
		-alias #{jks[:alias]} \
		-dname 'CN=#{jks[:CN]}, OU=#{jks[:OU]}, O=#{jks[:O]}, L=#{jks[:L]}, ST=#{jks[:ST]}, C=#{jks[:C]}' \
		-keypass #{jks[:keypass]} \
		-storepass #{jks[:storepass]} \
		-keystore #{jks[:path]}
	eos
	creates jks[:path]
end

execute "keytool-import" do
	command <<-eos
		keytool -importkeystore -srckeystore #{node["java_keystore"]["cacerts"]} \
		-destkeystore #{jks[:path]} \
		-deststorepass #{jks[:storepass]} \
		-srcstorepass #{jks[:storepass]}
	eos
	only_if do
		FileTest.exists? jks[:path]
	end
end
