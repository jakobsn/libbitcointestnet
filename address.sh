#!/bin/bash
x=1
echo current directory is $PWD
ls -l bx-linux-x64-qrcode
echo "address, seed, priv key, pup key" >> wallet.txt 
while [ true ]
do
	seed=$(bx seed)
	private_key=$(echo $seed | bx ec-new --config bx.cfg)
	public_key=$(echo $private_key | bx ec-to-public --config bx.cfg)
	address=$(echo $public_key | bx ec-to-address --config bx.cfg)

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
