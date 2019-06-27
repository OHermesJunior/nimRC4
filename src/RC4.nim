import strutils

proc RC4*(key, data: string): string =
  var converted_key, converted_data: seq[int]
  var state: array[256, int]
  for i in 0..255:
    state[i] = i
  for c in key:
    converted_key.add(ord(c))
  for c in data:
    converted_data.add(ord(c))

  var j, h = 0
  for i in 0..255:
    j = (j + state[i] + converted_key[h]) mod 256
    var temp = state[i]
    state[i] = state[j]
    state[j] = temp
    h = (h + 1) mod key.len

  j = 0
  h = 0

  for c in converted_data:
    j = (j + 1) mod 256
    h = (h + state[j]) mod 256
    var temp = state[h]
    state[h] = state[j]
    state[j] = temp
    result.add((c xor state[(state[j] + state[h]) mod 256]).toHex(2))