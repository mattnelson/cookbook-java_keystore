include_recipe "java::oracle"

jks = node[:java_keystore]
execute "keytool-generate" do
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
		keytool -importkeystore -srckeystore #{jks[:cacerts]} \
		-destkeystore #{jks[:path]} \
		-deststorepass #{jks[:storepass]} \
		-srcstorepass #{jks[:storepass]}
	eos
end
