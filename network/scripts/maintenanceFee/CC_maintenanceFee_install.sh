#!/bin/bash
echo
echo " ____    _____      _      ____    _____ "
echo "/ ___|  |_   _|    / \    |  _ \  |_   _|"
echo "\___ \    | |     / _ \   | |_) |   | |  "
echo " ___) |   | |    / ___ \  |  _ <    | |  "
echo "|____/    |_|   /_/   \_\ |_| \_\   |_|  "
echo "                                         "
echo

CHANNEL_NAME="mychannel"
CHAINCODE_NAME="maintenanceFee"
VERSION="$1"
: ${VERSION:="v1.0.0"}
DELAY="3"
TIMEOUT="10"
COUNTER=1
MAX_RETRY=10
CC_SRC_PATH="github.com/chaincode/${CHAINCODE_NAME}"

Orgs="$2"
Peers="$3"
: ${Orgs:="3"}
: ${Peers:="2"}

# Import shell script
. scripts/utils.sh

echo
echo "===================== Chaincode Install ====================="
echo

# Install chaincode on All peers
installChaincodeOnAllPeers () {
	for org in $(seq $Orgs); do
	    for peer in $(seq 0 $Peers); do
			echo "Installing chaincode on peer$peer.org$org..."
            installChaincode $peer $org
	    done
	done
}
installChaincodeOnAllPeers

# Instantiate chaincode on peer0.org3
echo "Instantiating chaincode on peer0.org3..."
instantiateChaincode 0 3 "AND Org1MSP.member Org2MSP.member Org3MSP.member"

sleep ${DELAY}

echo
echo " _____   _   _   ____   "
echo "| ____| | \ | | |  _ \  "
echo "|  _|   |  \| | | | | | "
echo "| |___  | |\  | | |_| | "
echo "|_____| |_| \_| |____/  "
echo "                        "
echo

exit 0

