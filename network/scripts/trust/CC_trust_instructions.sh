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
CHAINCODE_NAME="trust"
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

# Invoke chaincode on peer0.org1 and peer0.org2 peer0.org3
echo "Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3..."
chaincodeInvoke "0 1 0 3 0 2" "addTrust 0x60303AE22B998861BCE3B28F33EEC1BE758A213C86C93C076DBE9F558C11C752 Nil 임대 500 50 50 전세 2020-10-10 2021-10-09 Empty http://github.com/Jung"

sleep ${DELAY}

# Invoke chaincode on peer0.org1 and peer0.org2 peer0.org3
echo "Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3..."
chaincodeInvoke "0 1 0 3 0 2" "addTrust 0xEE812718AA3B6B8886B7FE7FB04CEAB9DE271BCA127F4868C8769FC5F6E1AB07 Nil 임대 400 502 150 월세 2020-10-10 2021-10-09 Empty http://github.com/S"

sleep ${DELAY}

# Invoke chaincode on peer0.org1 and peer0.org2 peer0.org3
echo "Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3..."
chaincodeInvoke "0 1 0 3 0 2" "addTrust 0xcc075E0DB800ADA34596AA56EF3E91E24A294695D5BD9A91EB23C8729DE081D2 Nil 임대 400 40 20 전세 2020-10-10 2021-10-09 Empty http://github.com/C" 

sleep ${DELAY}

# Invoke chaincode on peer0.org1 and peer0.org2 peer0.org3
echo "Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3..."
chaincodeInvoke "0 1 0 3 0 2" "addTrust 0xFC3497701F497A954E1A1AAD40BE2E640BF5A4770346C70ED7D18D4171D9EF39 Nil 임대 50000 30 30 월세 2020-10-10 2021-10-09 Empty http://github.com/WE" 

sleep ${DELAY}

# Query on chaincode on peer0.org2
echo "Querying chaincode on peer0.org2..."
chaincodeQuery 0 2 "readTrust 0x60303AE22B998861BCE3B28F33EEC1BE758A213C86C93C076DBE9F558C11C752"

# Invoke chaincode on peer0.org1 and peer0.org2 peer0.org3
echo "Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3..."
chaincodeInvoke "0 1 0 3 0 2" "updateTrust 0x9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08 0x60303AE22B998861BCE3B28F33EEC1BE758A213C86C93C076DBE9F558C11C752 임대 600 60 60 월세 2020-10-10 2021-10-09 Empty http://github.com/Choi"

sleep ${DELAY}

# Query on chaincode on peer0.org2
echo "Querying chaincode on peer0.org2..."
chaincodeQuery 0 2 "readTrust 0x9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08"

# Invoke chaincode on peer0.org1 and peer0.org2 peer0.org3
echo "Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3..."
chaincodeInvoke "0 1 0 2 0 3" "removeTrust 0x9F86D081884C7D659A2FEAA0C55AD015A3BF4F1B2B0B822CD15D6C15B0F00A08"

sleep ${DELAY}

# Query on chaincode on peer0.org2
echo "Querying chaincode on peer0.org2..."
chaincodeQuery 0 2 "readAllTrust"

echo
echo " _____   _   _   ____   "
echo "| ____| | \ | | |  _ \  "
echo "|  _|   |  \| | | | | | "
echo "| |___  | |\  | | |_| | "
echo "|_____| |_| \_| |____/  "
echo "                        "
echo

exit 0