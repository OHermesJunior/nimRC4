# RC4
RC4 library implementation for Nim

## Usage
Using this library is as simple as this:
```Nim
  import RC4

  toRC4("Key", "Plaintext") # Returns "BBF316E8D940AF0AD3"

  fromRC4("Key", "BBF316E8D940AF0AD3") # Returns "Plaintext"
```

## Installation
Installation via [nimble](https://github.com/nim-lang/nimble/):
```bash
> nimble install RC4
```


## Disclaimer
RC4 is not safe and should not be used in secure algorithms nowadays. However, RC4 was used a lot in the past, and that is why I did this.
