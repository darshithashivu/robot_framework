*** Settings ***
Documentation      This suit file handles all the test case related to the
...     valid credentials
Library     SeleniumLibrary
Resource    ../base/common_functionality.resource


Test Setup      Launch Browser
Test Teardown   End Browser

Test Template    Verify Invalid Credentials Template

*** Test Cases ***
TC1  Jonh    john123     Dutch   Invalid username or password
TC2  peter   peter123    Danish  Invalid username or password
TC3  Mark    Mark123     Greek   Invalid username or password


*** Test Cases ***
Verify Valid Credentials Test
       [arguments]   ${username}  ${pasword}  ${language}  ${expected_error}
    Input Text    id=authUser    ${username}
    Input Password    id=clearPass   ${pasword}
    Select From List By Label     name=languageChoice     ${language}
    Click Element    xpath=//button[@type='submit']
    Element Should Contain    //div[contains(text(),'Invalid')]  ${expected_error}