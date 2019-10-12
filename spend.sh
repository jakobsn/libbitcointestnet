#!/bin/bash
spender_address="n464EyMcrBP39Lpt3xq5pTGHvxuj7jYC11"
spender_private_key="37f35c48d5427c8f2b55d826041573c841480e907e832add4f459cc728e53818"
receiver_address="muvaovTmMJywzm23uwtxnr6K1ZVKxspV11"
prev_hash="7829fa46d9c838ada48850a1c193c4956db62e69ab419bd09dcae61d06d7ee67"

transactionID=$(bx tx-encode -c bx.cfg -i $prev_hash:0  -o $receiver_address:45000)
transactionObj=$(bx tx-decode -c bx.cfg -f json $transactionID)
#echo $transactionObj
prev_script=$(echo $transactionObj | jq ".transaction" | jq ".outputs[0]" | jq ".script")

echo $spender_private_key $prev_script $transactionID
#endorsement=echo $spender_private_key $prev_script $transactionID | $(bx input-sign -c bx.cfg)
endorsement="304402207bd0b6c7a4b59d6b394869398c70d27fcaf2c3657daa8d48afdba33b3979367802207750583331c8bfd4490cb6519dcae62597d74e20c79beef9baa10ae36e5af61a01"

echo $endorsement



