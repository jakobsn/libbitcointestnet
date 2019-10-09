#!/bin/bash
x=1
echo "address, seed, priv key, pup key" >> wallet.txt 
while [ true ]
do
	seed=$(bx seed)
	private_key=$(echo $seed | bx ec-new)
	public_key=$(echo $private_key | bx ec-to-public)
	address=$(echo $public_key | bx ec-to-address)

	if [[ $address == *"11" ]]; then
		echo $address >> wallet.txt
		echo $seed >> wallet.txt
		echo $private_key >> wallet.txt
		echo $public_key >> wallet.txt
		echo "" >> wallet.txt
	fi
  #echo "Welcome $x times"
  x=$(( $x + 1 ))
done
