*** Settings ***
Library                 QWeb
Library                 DateTime
Library                 Collections
Library                 ../libraries/eventhub_sender.py


*** Variables ***
@{RESULTS}


*** Keywords ***
Setup Browser
    Open Browser            about:blank    chrome
    SetConfig               DefaultTimeout    5s

End Suite
    Close All Browsers

    FOR    ${result}    IN    @{RESULTS}
        SendTestResultToEventhub    ${connection_string}    ${result}
    END

Set Start Time
    ${TEST_START_TIME}=     Get Current Date
    Set Suite Variable      ${TEST_START_TIME}

Update Results
    ${test_end_time}=       Get Current Date
    ${test_duration}=       Subtract Date From Date    ${test_end_time}    ${TEST_START_TIME}

    &{test_result}          Create Dictionary    
    ...                     suite_name=${SUITE NAME}
    ...                     test_name=${TEST NAME}
    ...                     test_status=${TEST STATUS}
    ...                     test_message=${TEST MESSAGE}
    ...                     test_duration=${test_duration}

    Append To List          ${RESULTS}    ${test_result}
