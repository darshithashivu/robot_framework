*** Settings ***
Documentation      This suit file handles all the test case related to the
...     valid credentials
Library     SeleniumLibrary
Resource    ../base/common_functionality.resource


Test Setup      Launch Browser
Test Teardown   End Browser

*** Test Cases ***
Verify Valid Credentials Test
    Input Text    id=authUser    Mark
    Input Password    id=clearPass    Mark123
    Select From List By Label     name=languageChoice    Greek
    Click Element    xpath=//button[@type='submit']
    Element Should Contain    //div[contains(text(),'Invalid')]  Invalid username or password