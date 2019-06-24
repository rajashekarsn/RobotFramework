*** Settings ***
Library           SeleniumLibrary

Library    SeleniumLibrary
*** Variables ***
${url1}           https://www.tutorialspoint.com/
${browser}        chrome
${url2}           https://www.google.com/    # second url

*** Test Cases ***
TC_001_Demo
    [Documentation]    This is the first test case. Here we are trying to open a browser, maximize the window and close it. We have added a html log at the end.
    [Tags]    TC01
    Open Browser    https://robotframework.org    chrome
    Maximize Browser Window
    Sleep    4 seconds    wait for display to be seen
    Close Browser
    Log    <H1>this is the first test case. <\H1>    HTML

TC_002_Call Keyword
    [Documentation]    Here our keyword "Test Browser" is called and variable is sent as an argument
    Test Browser    ${url1}    ${browser}    #this is a user defined keyword accepts url and browser as arguments
    Sleep    3 seconds    wait for display to be seen
    Log    This is a keyword call.
    Close Browser

TC_003_send arguments
    Test Browser    ${url2}    ${browser}

TC_004_Data Driven example
    [Documentation]    Here our keyword "Test Browser" is called as a Template. Arguments are sent is sent as in the table.
    [Tags]    TC04    Data Driven
    [Template]    Test Browser
    https://github.com/robotframework/RIDE/    chrome

*** Keywords ***
Test Browser
    [Arguments]    ${arg1}    ${arg2}    # accepts url and browser as arguments
    [Tags]    TC02
    Open Browser    ${arg1}    ${arg2}
    Maximize Browser Window
