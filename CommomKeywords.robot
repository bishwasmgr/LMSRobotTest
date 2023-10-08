*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
Login to Application
    [Arguments]    ${username}    ${password}
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    id=loginuname    ${username}
    Input Text    id=loginpassword    ${password}
    Click Button    id=login_button
    Wait Until Element Is Visible    id=dashboard_header
    ${cookies} =    Get Cookies
    Set Suite Variable    ${cookies}
    Capture Page Screenshot    Login_Success.png

*** Variables ***
${BROWSER}    Chrome
${BASE_URL}    http://localhost:8000
