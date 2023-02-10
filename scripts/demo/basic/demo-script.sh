# GETTING STARTED
function isSuccess() {
    ret=$?
    if [ $ret -ne 0 ]; then
       echo "Error $ret"
       exit $ret
    fi
}

# CREATE DATABASE AND KEYSTORE
kli init --name test --base "${KERI_TEMP_DIR}"  --nopasscode --salt 0ACDEyMzQ1Njc4OWxtbm9aBc
isSuccess

# NON-TRANSFERABLE
kli incept --name test --base "${KERI_TEMP_DIR}"  --alias non-trans --file ${KERI_DEMO_SCRIPT_DIR}/data/basic/non-transferable-sample.json
isSuccess

echo "Rotateion of non-transferable AID (should fail)"

kli rotate --name test --base "${KERI_TEMP_DIR}"  --alias non-trans
ret=$?
if [ $ret -eq 0 ]
then
   echo "Rotate of non-transferable AID should fail. Instead: $ret"
   exit $ret

fi


# TRANSFERABLE
echo "Creating transferabel AID"
kli incept --name test --base "${KERI_TEMP_DIR}"  --alias trans --file ${KERI_DEMO_SCRIPT_DIR}/data/basic/transferable-sample.json
isSuccess

echo "Rotating keys"
kli rotate --name test --base "${KERI_TEMP_DIR}"  --alias trans
isSuccess

kli rotate --name test --base "${KERI_TEMP_DIR}"  --alias trans --data @${KERI_DEMO_SCRIPT_DIR}/data/basic/anchor.json
isSuccess

kli interact --name test --base "${KERI_TEMP_DIR}"  --alias trans --data @${KERI_DEMO_SCRIPT_DIR}/data/basic/anchor.json
isSuccess

kli rotate --name test --base "${KERI_TEMP_DIR}"  --alias trans --next-count 3 --nsith 2
isSuccess

kli rotate --name test --base "${KERI_TEMP_DIR}"  --alias trans --next-count 3 --nsith 2
isSuccess

# SIGN AND VERIFY ARBITRARY DATA
echo "Sign data"
kli sign --name test --base "${KERI_TEMP_DIR}"  --alias trans --text @${KERI_DEMO_SCRIPT_DIR}/data/basic/anchor.json
isSuccess

echo "Verifying valid signatures"
kli verify --name test --base "${KERI_TEMP_DIR}"  --alias trans --prefix EIryzWYlZ9bQr7EhMAoBXk4r2h-OgaEqERid7-AHNp6o --text @${KERI_DEMO_SCRIPT_DIR}/data/basic/anchor.json --signature AABuQervAG8QLyvho99362U8TScec_4zYDVF1pUMWfWfKbl5thR6QakpvSvVMdcPcGYxi0McgNtW-Z3EhpC01I4A
isSuccess

kli verify --name test --base "${KERI_TEMP_DIR}"  --alias trans --prefix EIryzWYlZ9bQr7EhMAoBXk4r2h-OgaEqERid7-AHNp6o --text @${KERI_DEMO_SCRIPT_DIR}/data/basic/anchor.json --signature ABBJcS2ZbcHEdEEnaJE1CFUxdsKqkoU5TS34CImGh3s0cs-k3cNcy2PJxQ8WjIvAot1-cZ71o1E-WkqZ-tCTNZsJ
isSuccess

kli verify --name test --base "${KERI_TEMP_DIR}"  --alias trans --prefix EIryzWYlZ9bQr7EhMAoBXk4r2h-OgaEqERid7-AHNp6o --text @${KERI_DEMO_SCRIPT_DIR}/data/basic/anchor.json --signature ACBieMVQBXvIxeqQuHc4Db_-GUoFE9e37TW8t6DomwXdMcSxBiHJpDp3EJH1Dcz9lHKbFuCRqoNo4wywZGtUpOcB
isSuccess

echo "Verifying invalid signature (Should fail)"
kli verify --name test --base "${KERI_TEMP_DIR}"  --alias trans --prefix EIryzWYlZ9bQr7EhMAoBXk4r2h-OgaEqERid7-AHNp6o --text @${KERI_DEMO_SCRIPT_DIR}/data/basic/anchor.json --signature ACSHdal6kHAAjbW_frH83sDDCoBHw_nNKFysW5Dj8PSsnwVPePCNw-kFmF6Z8H87q7D3abw_5u2i4jmzdnWFsRDz
ret=$?
if [ $ret -eq 0 ]; then
   echo "Testing invalid signature should fail. Instead: $ret"
   exit $ret
fi


# ESTABLISHMENT ONLY
kli incept --name test --base "${KERI_TEMP_DIR}"  --alias est-only --file ${KERI_DEMO_SCRIPT_DIR}/data/basic/estonly-sample.json

echo "Interact should fail for establishment only AID."
kli interact --name test --base "${KERI_TEMP_DIR}"  --alias est-only --data @${KERI_DEMO_SCRIPT_DIR}/data/basic/anchor.json
ret=$?
if [ $ret -eq 0 ]; then
   echo "Interact should fail for establishment only. Instead: $ret"
   exit $ret
fi

kli rotate --name test --base "${KERI_TEMP_DIR}"  --alias est-only
isSuccess

kli rotate --name test --base "${KERI_TEMP_DIR}"  --alias est-only --data @${KERI_DEMO_SCRIPT_DIR}/data/basic/anchor.json
isSuccess

echo 'Test Complete'
