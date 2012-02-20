Description
===========

Generates a java keystore file.

Requirements
============

Platform:

* Debian, Unbuntu (Sun)
* Mac OS X

Attributes
==========

* `node["java_keystore"]["path"]` - The path to save the keystore file.
* `node["java_keystore"]["alias"]` - The keystore alias.
* `node["java_keystore"]["keypass"]` - The key password.
* `node["java_keystore"]["storepass"]` - The keystore password.
* `node["java_keystore"]["CN"]` - keystore CN (First & Last Name)
* `node["java_keystore"]["OU"]` - keystore OU (Organizational Unit)
* `node["java_keystore"]["O"]` - keystore O (Organization Name)
* `node["java_keystore"]["L"]` - keystore L (City or Locality)
* `node["java_keystore"]["ST"]` - keystore ST (Province or State)
* `node["java_keystore"]["C"]` - keystore C (Country)
* `node["java_keystore"]["cacerts"] - path to java cacerts. Default
  $JAVA_HOME/lib/security/cacerts

