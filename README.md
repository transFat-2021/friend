# friends.aleo

## Build Guide

To compile this Aleo program, run:
```bash
aleo build

```


## fuction
永久广告投放


## use
- step 1


注意，转换你想要填充的信息：
`from binascii import hexlify, unhexlify



class BytesIntEncoder:



    @staticmethod

    def encode(b: bytes) -> int:

        return int(hexlify(b), 16) if b != b'' else 0



    @staticmethod

    def decode(i: int) -> int:

        return unhexlify('%x' % i) if i != 0 else b''`
- step 2
使用一个随机数，投放你的信息，永久存储在链上

```bash
leo run mint "3u32" "12312300field" "12300field" "123141200field" "0u8"
```
