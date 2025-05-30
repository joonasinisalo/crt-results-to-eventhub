*** Settings ***
Resource                ../resources/common.resource

Test Setup              Set Start Time
Test Teardown           Update Results

Suite Setup             Setup Browser
Suite Teardown          End Suite


*** Variables ***
${WEBSHOP_URL}          https://qentinelqi.github.io/shop/


*** Test Cases ***
Verify Product: Sacha the Deer
    GoTo                ${WEBSHOP_URL}
    VerifyText          Find your spirit animal
    ClickText           Sacha the Deer    delay=1
    VerifyText          Sacha’s elegant antlers
    VerifyText          $9.00

Verify Product: Bumble the Elephant
    GoTo                ${WEBSHOP_URL}
    VerifyText          Find your spirit animal
    ClickText           Bumble the Elephant    delay=1
    VerifyText          Bumble the humble elephant is your shining star
    VerifyText          $11.00

Verify Product: Gerald the Giraffe
    GoTo                ${WEBSHOP_URL}
    VerifyText          Find your spirit animal
    ClickText           Gerald the Giraffe    delay=1
    VerifyText          Gerald the giraffe isn’t particularly spiritual
    VerifyText          $9.00

Verify Product: Todd the Hedgehog
    Skip
    GoTo                ${WEBSHOP_URL}
    VerifyText          Find your spirit animal
    ClickText           Todd the Hedgehog    delay=1
    VerifyText          Todd the hedgehog may have a spiky exterior
    VerifyText          $9.00
