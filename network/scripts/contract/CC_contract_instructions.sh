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
CHAINCODE_NAME="contract"
VERSION="$1"
: ${VERSION:="v1.0.0"}
DELAY="3"
TIMEOUT="10"
COUNTER=1
MAX_RETRY=10
CC_SRC_PATH="github.com/chaincode/${CHAINCODE_NAME}"

# Import shell script
. scripts/utils.sh

echo
echo "===================== Chaincode Instructions ====================="
echo

# Invoke chaincode on peer0.org1 and peer0.org2
echo "Sending invoke transaction on peer0.org1 peer0.org2"
chaincodeInvoke "0 1 0 2" "initLedger"

sleep ${DELAY}


# Query on chaincode on peer0.org1
echo "Querying chaincode on peer0.org1..."
chaincodeQuery 0 1 "queryAllCars"



echo
echo " _____   _   _   ____   "
echo "| ____| | \ | | |  _ \  "
echo "|  _|   |  \| | | | | | "
echo "| |___  | |\  | | |_| | "
echo "|_____| |_| \_| |____/  "
echo "                        "
echo

exit 0