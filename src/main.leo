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

    mapping luck: u16 => address;

    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }

    transition mint_public(info: FriendInfo,num: u16) -> Friend {
        assert_neq(10000000field,info.name);
        return Friend{
            owner: self.caller,
            gates: 0u64,
            num,
            info,
        } then finalize(self.caller,num,info);
    }

    finalize mint_public(public addr: address,public num: u16,info: FriendInfo){
      Mapping::set(luck,num,addr);
      Mapping::set(detailed,addr,info);
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

    transition match_frient(public num: u16) -> FriendInfo{
        return info then finalize(num);

    }
    finalize match_frient(public num: u16){
        let addr: address = Mapping::get(luck,num);
        let info: FriendInfo = Mapping::get(detailed,addr);
        return info;
    }
}
