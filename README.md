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
### Goblin
增加一个摇奖机系统，通过输入record，在固定字段输入多个数字，和想下注的测试网积分，会产生一个新的record记录。同时有一个Transaction ID，如果Transaction ID的最后一位和你输入的record的固定字段的字符匹配。会按照赔率给你转测试网积分。

```bash
leo run mint_marble 

## 想下注0df,用上述转换后得3171430

leo run gambling $‘record' '3171430field' '10u64' 
```

todo:
前端可视化主页
后续增加自动赔付机制