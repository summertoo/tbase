module tmove::tbase{

    use std::debug::{Self,print};
    use std::string::{Self,utf8,String};

    const PI:u64 = 31415926;

    public fun tbase(){
        print(&utf8(b"start tbase   ... "));
    }

    public fun tpai():u64{
        PI
    }

    #[test]
    fun nowtest(){
        tbase();
    }

}