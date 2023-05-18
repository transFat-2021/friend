// The 'friends' program.
program friends.aleo {


    record marble {
        owner: address,
        gates: u64,
        num: u64,
        data: field,
    }




    

    transition mint_marble() -> marble{
        return marble{
            owner: self.caller,
            gates: 0u64,
            num: 50u64,
            data: 1field,
        };
    }

    transition gambling(
        m: marble, 
        public data: field,
        public num: u64,
    ) -> marble{
        let balance: u64 = m.num - num;
        
        return marble{
            owner: self.caller,
            gates: 0u64,
            num: balance,
            data: data,
        };
    }
}
