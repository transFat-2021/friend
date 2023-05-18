# friends.aleo

## Build Guide

To compile this Aleo program, run:
```bash
aleo build

```



## use

```python
from binascii import hexlify, unhexlify



class BytesIntEncoder:



    @staticmethod

    def encode(b: bytes) -> int:

        return int(hexlify(b), 16) if b != b'' else 0



    @staticmethod

    def decode(i: int) -> int:

        return unhexlify('%x' % i) if i != 0 else b''`

```
mint record
```bash
leo run mint "3u32" "12312300field" "12300field" "123141200field" "0u8"
```
### Goblin
Adding a lottery machine system, by entering record, entering multiple numbers in a fixed field, and the test net credits that you want to bet, will produce a new record with a Transaction ID if Transaction The match between the last digit of the ID and the characters in the fixed field of the record you entered will give you the test net credit at odds

### example
```bash
leo run mint_marble 

## Want to bet 0df,With the above conversion 3171430

leo run gambling $‘record' '3171430field' '10u64' 
```

todo:
- Front-end visual home page
- Automatic compensation mechanism will be added later
