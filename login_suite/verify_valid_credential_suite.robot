*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Verify Valid Credentials Test
    Open Browser     browser=edge      executable_path=${EXECDIR}\\drivers\\msedgedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To  url= url=https://demo.openemr.io/b/openemr/index.php
    Input Text    id=authUser    admin=123
    Input Password    id=clearPass    pass
    Select From List By Label     name=languageChoice    English (Indian)
    Click Element    xpath=//button[@type='submit']
    Title Should Be    OpenEMR
    Close Browser