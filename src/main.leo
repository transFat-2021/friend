// The 'friends' program.
program friends.aleo {
    record AdInfo {
        owner: address,
        gates: u64,
        name: field,
        info: field,
        line: field,
        level: u8,
    }
    mapping Name: u16 => field;
    mapping Info: u16 => field;
    mapping Line: u16 => field;
    mapping Level: u16 => u8;

    transition mint(
        num: u32,
        public name: field,
        public info: field,
        public line: field,
        public level: u8,
    ) -> Info {
        return AdInfo{
            owner: self.caller,
            gates: 0u64,
            name,
            info,
            line,
            level
        } then finalize(num,name,info,line,level);

    }
    finalize mint(
        num: u32,
        public name: field,
        public info: field,
        public line: field,
        public level: u8,
    ){
        let n: field = Mapping::get_or_init(Name,num,0field);
        let i: field = Mapping::get_or_init(Info,num,0field);
        let l: field = Mapping::get_or_init(Line,num,0field);
        let L: u8 = Mapping::get_or_init(Level,num,0u8);
        Mapping::set(Name,num,name);
        Mapping::set(Info,num,info);
        Mapping::set(Line,num,line);
        Mapping::set(Level,num,level);
    }
}
