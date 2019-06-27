import strutils

proc genKeystream(key: string): array[256, int] =
  var converted_key: seq[int]
  var state: array[256, int]
  for i in 0..255:
    state[i] = i
  for c in key:
    converted_key.add(ord(c))

  var j, h = 0
  for i in 0..255:
    j = (j + state[i] + converted_key[h]) mod 256
    var temp = state[i]
    state[i] = state[j]
    state[j] = temp
    h = (h + 1) mod key.len
  return state

proc toRC4*(key, data: string): string =
  var converted_data: seq[int]
  for c in data:
    converted_data.add(ord(c))

  var state = genKeystream(key)
  var j, h = 0

  for c in converted_data:
    j = (j + 1) mod 256
    h = (h + state[j]) mod 256
    var temp = state[h]
    state[h] = state[j]
    state[j] = temp
    result.add((c xor state[(state[j] + state[h]) mod 256]).toHex(2))

proc fromRC4*(key, data: string): string =
  var state = genKeystream(key)
  var i, j, h = 0

  while i < data.len:
    j = (j + 1) mod 256
    h = (h + state[j]) mod 256
    var temp = state[h]
    state[h] = state[j]
    state[j] = temp
    result.add(char((fromHex[int](data[i] & data[i+1]) xor state[(state[j] + state[h]) mod 256])))
    i += 2