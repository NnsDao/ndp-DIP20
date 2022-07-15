NETWORK=$1
MODE=$2

dfx build --network ic token
dfx canister --network $NETWORK install token --argument="(\"data:image/jpeg;base64,$(base64 NDP.png)\", \"NnsDAO Protocol\", \"NDP\", 8, 10000000000000000, principal \"$(dfx identity get-principal)\", 10000)" -m $MODE
dfx canister --network $NETWORK call token setFeeTo "(principal \"$(dfx identity get-principal)\")"
dfx canister --network $NETWORK call token setFee "(10000)"