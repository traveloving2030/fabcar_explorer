#!/bin/bash

echo
echo "====================Testing Chaincode user===================="
echo

# docker exec cli ./scripts/user/CC_user_install.sh
# docker exec cli ./scripts/user/CC_user_instructions.sh
# docker exec cli ./scripts/user/CC_user_upgrade.sh

echo
echo "====================Testing Chaincode trust===================="
echo

# docker exec cli ./scripts/trust/CC_trust_install.sh
# docker exec cli ./scripts/trust/CC_trust_instructions.sh
# docker exec cli ./scripts/trust/CC_trust_upgrade.sh

echo
echo "====================Testing Chaincode maintenanceFee===================="
echo

# docker exec cli ./scripts/maintenanceFee/CC_maintenanceFee_install.sh
# docker exec cli ./scripts/maintenanceFee/CC_maintenanceFee_instructions.sh
# docker exec cli ./scripts/maintenanceFee/CC_maintenanceFee_upgrade.sh

echo
echo "====================Testing Chaincode contract=================="
echo

docker exec cli ./scripts/contract/CC_contract_install.sh
docker exec cli ./scripts/contract/CC_contract_instructions.sh

