# NFT-contract

## Create a Free Alchemy Account
First of all, let's need to navigate to alchemy.com click on “Login” and create a new account:
Select the Ethereum ecosystem:
Give your application app and team a name, choose the Goerli network and click on create App:
Click on the application with the name you decided, in this case, “test”, click on the “VIEW KEY” button on the top right corner, and copy the HTTP URL:
 
## Create Metamask Wallet
Once Metamask will be installed, click on the Network dropdown menu, and on “add network”!
fill in the Goerli Network and RPC URL info.

Network name: Alchemy Goerli
New RPC URL: the HTTP URL of the Goerli Alchemy Application
Chain ID: 5
Currency Symbol: GoerliETH
Block Explorer: https://goerli.etherscan.io

## Get Free Goerli Test ETH

## Compile and Deploy the NFT Smart Contract on the Goerli Testnet

## Creating and Uploading the Metadata on IPFS
First of all, navigate to filebase.com and create a new account.
Once logged in, click on the bucket button on the left-hand side menu, and create a new bucket:
Navigate into the bucket, click on the upload button, and upload the image you want to use for your NFT
Once uploaded click on it and copy the IPFS Gateway URL:
Using any text editor, paste the following JSON code:

![Screenshot 2022-10-12 140726](https://user-images.githubusercontent.com/78193662/195293844-80b4b6c8-a2e1-4609-a1ed-943a00a83e40.png)


And save the file as "metadata.json". Move back to Filebase and upload the metadata.json file in the same bucket where we uploaded the Image.
Lastly, click on the CID and copy it, we’ll need it in the next part to build the token URI when minting out NFT:

## Mint Your Goerli NFT
Go back to Remix and in the Deploy & Run Transactions menu, go under “deployed contracts” - and click on the contract we just deployed, it will open up a list of all the methods contained in your Smart contact:
Click on the safeMint method dropdown icon and paste your address and the following string into the uri field:  ipfs://\<your\_metadata\_cid>
Clicking on transact will create a Metamask popup prompting you to pay the gas fees.
Click on "sign" and go on minting your first NFT!
Wait a couple of seconds and, to make sure the mint went through successfully, copy and paste your address in the balanceOf method input, and run it - it should show you have 1 NFT.
Do the same with the tokenUri method, inserting “0” as the id argument - it should display your tokenURI.

## Visualize Your NFT on OpenSea
Navigate to testnets.opensea.io and log in with your Metamask wallet. Then click on your profile picture, you should see your newly minted NFT there. If the image is not yet visible, click on it, and click on the “refresh metadata” button.
Sometimes OpenSea has hard times recognizing testnet metadata - and could take up to 6 hours to see it.
