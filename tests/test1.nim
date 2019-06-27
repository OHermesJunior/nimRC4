# To run these tests, simply execute `nimble test`.

import unittest

import RC4
test "rc4 encryption":
  doAssert RC4("Wiki", "pedia") == "1021BF0420"
  doAssert RC4("Key", "Plaintext") == "BBF316E8D940AF0AD3"
