# To run these tests, simply execute `nimble test`.

import unittest

import RC4
test "RC4 Encryption":
  doAssert toRC4("Wiki", "pedia") == "1021BF0420"
  doAssert toRC4("Key", "Plaintext") == "BBF316E8D940AF0AD3"

test "RC4 Decryption":
  doAssert fromRC4("Wiki", "1021BF0420") == "pedia"
  doAssert fromRC4("Key", "BBF316E8D940AF0AD3") == "Plaintext"
