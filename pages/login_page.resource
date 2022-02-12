*** Settings ***
Documentation   this file handles all the operation in the login page of openemr

Resource    ../base/common_functionality.resource

*** Variables ***
${USERNAME_LOCATOR}     id=authUser
${PASSWORD_LOCATOR}     id=clearPass
${LANGUAGE_LOCATOR}     name=languageChoice
${LOGIN_LOCATOR}        xpath=//button[@type='submit']
${ERROR_LOCATOR}        xpath=//div[contains(text(),'Invalid')]

*** Keywords ***
Enter Username
    [Arguments]     ${username}
    Input Text    ${USERNAME_LOCATOR}    ${username}

Enter Password
    [Arguments]     ${password}
    Input Password    ${PASSWORD_LOCATOR}    ${password}

Select Language Using Label
    [Arguments]     ${language}
    Select From List By Label    ${LANGUAGE_LOCATOR}     ${language}

Click Login
        Click Element    ${LOGIN_LOCATOR}

Validate Invalid Error Message
    [Arguments]     ${expected_error}
    Element Should Contain    ${ERROR_LOCATOR}       ${expected_error}