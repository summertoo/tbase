#[allow(unused_use)]
module tmove::tbase{
    
    use std::debug::{Self,print};
    
    use std::string::{Self,utf8,String};

    use sui::tx_context::{sender,TxContext};
    use sui::object::{Self,UID,ID};
    use sui::event;
    use sui::clock::{Self, Clock};
    use sui::random::{Self, Random, new_generator};
    use std::vector;
    use sui::table;
    use sui::coin::{Self, Coin};
    use sui::sui::SUI;
    use sui::bag;

    const PI:u64 = 31415926;

    public struct TMOVE has drop{}
    // struct TMOVE has drop{}

    #[allow(unused_field)]
    public struct TnowAck has store {
    // struct TnowAck has store {
        nowbag : bag::Bag,
    }

    #[allow(unused_field)]
    public struct Cast has store,drop{
    // struct Cast has store,drop{
        user:address,
    }

    // --------------- Events ---------------
    public struct TbaseExt has copy, drop {
    // struct TbaseExt has copy, drop {
        tbase_ext: u64,
    }

    public struct TrndExt has copy, drop {
    // struct TrndExt has copy, drop {
        trnd_ext: u8,
    }

    public struct ArrayExt has copy, drop {
    // struct ArrayExt has copy, drop {
        array_ext: u64,
    }

    // test TxContext
    public entry fun mint(amount:u64, test:u64 , _ctx:&mut TxContext){
        let _ = _ctx;
        let _ = amount;
        let _ = test;
        // let nowbag = TnowAck{
        //     nowbag : bag::new(_ctx)
        // }

        //let TnowAck{abag} = nowbag;
        
    }

    //中文注释
    public fun aka():u64{
        let test = 0;
        test
    }

    //
    public entry fun shownumber(clock: &Clock){
        //let des_number = ((clock::timestamp_ms(clock) % 11) as u8);
        let des_number = clock::timestamp_ms(clock);
        
        //can not see the number in client 
        print(&des_number);

        event::emit(TbaseExt{
            tbase_ext:des_number
        });
    }

    //#[allow(lint(public_random))]
    entry fun showrandom(r: &Random, ctx: &mut TxContext){
        
        let mut generator = new_generator(r, ctx);
        let v = random::generate_u8_in_range(&mut generator, 1, 100);
        // let generator = new_generator(r, ctx);
        // let v = random::generate_u8_in_range(&mut generator, 1, 100);

        event::emit(TrndExt{
            trnd_ext:v
        });
    }

    public entry fun showarray( va : vector<u8>){
        let veclen = vector::length(&va);
        print(&veclen);

        event::emit(ArrayExt{
            array_ext:veclen
        });
    }

    //中文注释
    public fun tbase(){
        print(&utf8(b"start tbase   ... "));

    }

    public fun tpai():u64{
        PI
    }

    public fun tout(out:u64){
        event::emit(ArrayExt{
            array_ext:out
        });
    }

    public fun tmul():u8{
        let mask = 0xff;
        let mut m = 1;
        m = mask ^ m;
        m
    }

    #[allow(dead_code)]
    public fun testValue(in:u64):bool{
        if(in < 10){
            abort 3003
        }
        else{
            return true
        }
    }


    //按位取反
    public fun BitWiseNot(in:u8):u8{
        let mask:u8 = 0xff;
        mask ^ in
    }

    //vector::push_back(&mut room.usrList,user);
    public fun uint_to_string(num: u256): String {

        let mut res:vector<u8> = vector::empty();//2024
        let mut t:u256 = 10;//2024
        // let res:vector<u8> = vector::empty();
        // let t:u256 = 10;

        loop {
            let nl = num /t;
            if(t == 10){
                let ten = num % 10;
                res.push_back((48 + ten) as u8);//2024
                // vector::push_back(&mut res,(48 + ten as u8));
            };

            if(nl <= 0) {
                break
            };

            let n2 = nl % 10;
            t=t*t;
            res.push_back((48 + n2) as u8);//2024
            // vector::push_back(&mut res,(48 + n2 as u8));
        };

        // res.reverse();//2024
        vector::reverse(&mut res);
        utf8(res)
    }

    public fun testcoin(t: &mut Coin<SUI>){
        let coin_balance = coin::balance_mut(t);
    }

    #[test]
    fun tests(){
        let mut leftword = utf8(b"aabb");
        let now = uint_to_string(44123);
        std::string::append(&mut leftword,now);
        print(&leftword);
    }

    #[test_only]
    use sui::test_scenario;

    #[test]
    fun nowtest(){
        tbase();
        // let mut nowarray = vector::empty();
        let mut nowarray = vector::empty();

        vector::push_back(&mut nowarray,1);
        vector::push_back(&mut nowarray,2);
        

        showarray(nowarray);
    }

    #[test]
    fun test_queue(){
        print(&utf8(b"queue start ..."));
        let looker:address = @0xBBBBCCDD01;
        let _looker2:address = @0xBBBBCCDD02;
        // let mut scenario = test_scenario::begin(looker);
        // let mut scenario = test_scenario::begin(looker);
        // let mut _ctx : &mut TxContext = test_scenario::ctx(&mut scenario );
        let mut scenario = test_scenario::begin(looker);
        let _ctx : &mut TxContext = test_scenario::ctx(&mut scenario );

        test_scenario::end(scenario);
    }

    #[test]
    fun test_mul(){
        print(&utf8(b"test_mul start ..."));
        let t = BitWiseNot(41);
        print(&t);
    }

}