// The 'friends' program.
program friends.aleo {

    struct FriendInfo {
        name: field,
        line: field,
        orientation: u8,
    }
    struct Match{
        one: address,
        two: address,
    }
    record Friend {
        owner: address,
        gates: u64,
        num: u16,
        info: FriendInfo,
    }
    mapping detailed: address => FriendInfo;

    mapping luck: u16 => Match;

    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }

    transition mint_public(info: FriendInfo,num: u16) -> Friend {
        assert_neq(10000000field,info.name);
        let m: Match = Match{
            one: self.caller,
            two: self.caller,
        }
        return Friend{
            owner: self.caller,
            gates: 0u64,
            num,
            info,
        } then finalize(m,num,info);
    }

    finalize mint_public(m: Match,public num: u16,info: FriendInfo){
      Mapping::set(luck,num,m);
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
        let info: FriendInfo;
        return  info then finalize(num);

    }
    finalize match_frient(public num: u16)  {
        let addr: Match = Mapping::get(luck,num);
        let info: FriendInfo = Mapping::get(detailed,addr);
        
    }
}
