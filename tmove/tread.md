
PACKAGE_ID=0x94ace37526a8aa6844e36903fab5a1024a078a1dadc558393e023b1925f69c5b
Module_ID=tbase
function_ID=shownumber

sui client call --package 0x94ace37526a8aa6844e36903fab5a1024a078a1dadc558393e023b1925f69c5b --module tbase --function shownumber --args 0x6 --gas-budget 100000000


sui client call --package 0xed7fa85ae32ef0c9b3005600ac7edec1cf42b54e4b5db9a9d735d2d220dd6368 --module tbase --function showrandom --args 0x8 --gas-budget 100000000

sui client call --package 0x7bab4d994f8755766df359fbd7d83481ca87e085b3337eb7c6011ae67b4803a7 --module tbase --function showarray --args "[22,33,99]" --gas-budget 100000000

sui client call --package 0x7bab4d994f8755766df359fbd7d83481ca87e085b3337eb7c6011ae67b4803a7 --module tbase --function tout --args 1234 --gas-budget 100000000

sui client call --package 0xc88c297e88ffa5efda01ded1836d517f641423d23da9e9b88e4346ccf2c6841e --module tbase --function testValue --args 100 --gas-budget 100000000

测试网不存在 0x8 

devnet

sui client call --package 0x221563c97717cc0a7cb578de896016a80adaf1781abe8158a9f2196efcfca69c --module tbase --function showrandom --args 0x8 --gas-budget 100000000

参考资料

https://learnblockchain.cn/article/7711

https://github.com/MystenLabs/sui/blob/main/sui_programmability/examples/nfts/sources/random_nft.move
https://github.com/MystenLabs/sui/blob/main/sui_programmability/examples/games/sources/raffles.move

https://docs.sui.io/guides/developer/advanced/randomness-onchain


HAND

https://suiscan.xyz/
https://suivision.xyz/
