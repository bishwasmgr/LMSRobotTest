*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           http://localhost:8000/viewissuedbook/    # Update with your local server URL
${Browser}       Chrome

*** Test Cases ***

Open Website
    Open Browser    ${URL}    ${Browser}

Check Table Headers
    # Wait until the page is loaded
    Wait Until Page Contains Element    xpath=//th[text()='Student Name']
    Wait Until Page Contains Element    xpath=//th[text()='Student id']
    Wait Until Page Contains Element    xpath=//th[text()='Book Name']
    Wait Until Page Contains Element    xpath=//th[text()='Subject']
    Wait Until Page Contains Element    xpath=//th[text()='Issued Date']
    Wait Until Page Contains Element    xpath=//th[text()='Return Date']
    Wait Until Page Contains Element    xpath=//th[text()='Fine']

    # Verify the presence of table headers
    Element Should Be Visible    xpath=//th[text()='Student Name']
    Element Should Be Visible    xpath=//th[text()='Student id']
    Element Should Be Visible    xpath=//th[text()='Book Name']
    Element Should Be Visible    xpath=//th[text()='Subject']
    Element Should Be Visible    xpath=//th[text()='Issued Date']
    Element Should Be Visible    xpath=//th[text()='Return Date']
    Element Should Be Visible    xpath=//th[text()='Fine']

    Close Browser
