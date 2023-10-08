** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           http://localhost:8000  # Update with your webpage URL
${Browser}       Chrome

*** Test Cases ***
To Check is server is running
    Open Browser    ${URL}    ${Browser}
    Wait Until Page Contains Element    link=Home
    Wait Until Page Contains Element    link=Staff
    Wait Until Page Contains Element    link=About Us
    Wait Until Page Contains Element    link=Contact Us
    Close Browser