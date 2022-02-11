*** Settings ***
Documentation  This file contains reusable keywords

Library  SeleniumLibrary

*** Keywords ***
Launch Browser
     Open Browser    browser=edge        executable_path=${EXECDIR}${/}drivers${/}msedgedriver.exe
     Maximize Browser Window
     Set Selenium Implicit Wait  20s
     Go To  url=https://demo.openemr.io/b/openemr

End Browser
     Capture Page Screenshot
     Close Browser
