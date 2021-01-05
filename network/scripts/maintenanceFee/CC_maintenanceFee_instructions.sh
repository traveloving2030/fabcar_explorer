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

# Import shell script
. scripts/utils.sh

echo
echo "===================== Chaincode Instructions ====================="
echo

# Invoke chaincode on peer0.org1 and peer0.org2 peer0.org3
echo "Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3..."
chaincodeInvoke "0 1 0 2 0 3" "addMaintenanceFee 한빛아파트관리소 1234567890 2020-10-10 2020-10-15 1500000 1540000 홍길동 http://github.com/J"

sleep ${DELAY}

# Invoke chaincode on peer0.org1 and peer0.org2 peer0.org3
echo "Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3..."
chaincodeInvoke "0 1 0 2 0 3" "addMaintenanceFee 새뜸아파트관리소 1111111111 2020-10-10 2020-10-15 1400000 1540000 김철수 http://github.com/JS"

sleep ${DELAY}

# Invoke chaincode on peer0.org1 and peer0.org2 peer0.org3
echo "Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3..."
chaincodeInvoke "0 1 0 2 0 3" "addMaintenanceFee 현대아파트관리소 2222222222 2020-10-12 2020-10-22 1200000 1540000 이영희 http://github.com/JT"

sleep ${DELAY}

# Invoke chaincode on peer0.org1 and peer0.org2 peer0.org3
echo "Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3..."
chaincodeInvoke "0 1 0 2 0 3" "addMaintenanceFee 한우리아파트관리소 333333333 2020-10-17 2020-10-25 1700000 1540000 박땡글 http://github.com/JQ"

sleep ${DELAY}

# Query on chaincode on peer0.org3
echo "Querying chaincode on peer0.org3..."
chaincodeQuery 0 3 "readMaintenanceFee 1234567890"

# Invoke chaincode on peer0.org1 and peer0.org2 peer0.org3
echo "Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3..."
chaincodeInvoke "0 1 0 2 0 3" "updateMaintenanceFee 한빛아파트관리소 1234567890 2020-11-10 2020-10-15 1505000 1640000 홍길동 http://github.com/J"

sleep ${DELAY}

# Query on chaincode on peer0.org3
echo "Querying chaincode on peer0.org3.."
chaincodeQuery 0 3 "readMaintenanceFee 1234567890"

# Invoke chaincode on peer0.org1 and peer0.org2 peer0.org3
echo "Sending invoke transaction on peer0.org1 peer0.org2 peer0.org3..."
chaincodeInvoke "0 1 0 2 0 3" "removeMaintenanceFee 1234567890"

sleep ${DELAY}

# Query on chaincode on peer0.org3
echo "Querying chaincode on peer0.org3..."
chaincodeQuery 0 3 "readAllMaintenanceFee"

echo
echo " _____   _   _   ____   "
echo "| ____| | \ | | |  _ \  "
echo "|  _|   |  \| | | | | | "
echo "| |___  | |\  | | |_| | "
echo "|_____| |_| \_| |____/  "
echo "                        "
echo

exit 0

