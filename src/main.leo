// The 'friends' program.
program friends.aleo {

    struct FriendInfo {
        name: field,
        line: field,
        orientation: u8,
    }
    
    record Friend {
        owner: address,
        gates: u64,
        num: u16,
        info: FriendInfo,
    }
    mapping detailed: address => FriendInfo;

    mapping luck: u32 => address;

    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }
    transition mint(num: u16 ) -> Friend {
    let info: FriendInfo = FriendInfo{
            name: 34454714849716581field,
            line: 13647190699field,
            orientation: 1u8,
        };
        return Friend {
            owner: self.caller,
            gates: 0u64,
            num: num,
            info: info,
        };
    }
    transition mint_public(info: FriendInfo,num: u16) -> Friend {
        return Friend{
            owner: self.caller,
            gates: 0u64,
            num,
            info,
        } then finalize(self.caller,num);
    }

    finalize mint_public(public addr: address,public num: u16){
      Mapping::set(luck,num,addr);
    }
    transition mint_frient(name: field,line: field,orientation: u8) -> FriendInfo {
        if ( orientation < 4u8){
        return FriendInfo{
            name,
            line,
            orientation,
        };
    }
            return FriendInfo{
            name: 10000000field,
            line: 10000000field,
            orientation ,
        };        
        
    }
}
