#!/bin/bash
RCol='\e[0m'

Bla='\e[0;30m';
Red='\e[0;31m';
Gre='\e[0;32m';
Yel='\e[0;33m';
Blu='\e[0;34m';
Pur='\e[0;35m';
Cya='\e[0;36m';
Lbl='\e[1;34m';

FUNC_ADDR='localhost:1633'
BEE_RES=`curl -s ${FUNC_ADDR}`

if [[ "${BEE_RES}" =~ "Ethereum Swarm Bee" ]]; then
        echo -e "${Gre} [1] BEE is working properly!${RCol}"
else
        echo -e "${Red} [1] BEE is not working properly!${RCol}"
fi

PEER_NUM=`curl -s http://localhost:1635/peers | jq '.peers | length'`
if [ ${PEER_NUM} == 0 ]; then
        echo -e "${Red} [2] BEE haven't conneted to any peer.${RCol}"
else
        echo -e "${Gre} [2] BEE node has connected to ${PEER_NUM} peers.${RCol}"
fi

NEW_CHEQUE=`./cashout.sh | wc -l`
if [ ${NEW_CHEQUE} == 0 ]; then
        echo -e "${Lbl} [3] You have no new cheque${RCol}"
else
        echo -e "${Yel} [3] Congrats! You have ${NEW_CHEQUE} new cheques!"
        echo -e '--------------------CASHOUT-ALL--------------------${RCol}'
        ./cashout.sh cashout-all
fi
