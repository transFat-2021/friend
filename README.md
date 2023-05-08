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
create FriendInfo
如果返回的name和line全部为10000000field，则无效FriendInfo

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
create luck 

- step 3 
匹配luck