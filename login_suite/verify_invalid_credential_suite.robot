*** Settings ***
Documentation      This suit file handles all the test case related to the
...     invalid credentials
Library     SeleniumLibrary
Resource    ../base/common_functionality.resource

Test Setup      Launch Browser
Test Teardown   End Browser

Test Template       Verify Invalid Credential Template
#*** Comments ***
#Create a template and pass the test methods
#John, john123, Dutch, Invalid username or password
#peter, peter123, Danish, Invalid username or password
#Mark, Mark123, Greek, Invalid username or password


*** Test Cases ***
TC1     John        john123         Dutch       Invalid username or password
TC2     peter        peter123         Danish       Invalid username or password
TC3     ${EMPTY}        peter123         Dutch       Invalid username or password
TC4     peter        ${EMPTY}          Greek       Invalid username or password


*** Keywords ***
Verify Invalid Credential Template
    [Arguments]     ${username}     ${password}     ${language}     ${expected_error}
    Input Text    id=authUser    ${username}
    Input Password    id=clearPass    ${password}
    Select From List By Label    name=languageChoice    ${language}
    Click Element    xpath=//button[@type='submit']
    Element Should Contain    //div[contains(text(),'Invalid')]    ${expected_error}
    