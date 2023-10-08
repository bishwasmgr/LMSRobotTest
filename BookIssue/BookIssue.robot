*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           http://127.0.0.1:8000/stafflogin/
${Browser}       Chrome
${StudentID}     S12345       # Replace with the desired student ID
${BookID}        SampleBookID # Replace with the desired book ID

*** Test Cases ***

Open Website
    Open Browser    ${URL}    ${Browser}

Login to your Account
    Input Text    id=loginuname    testuser    # Use the same username as used during signup
    Input Text    id=loginpassword    secret123  # Use the same password as used during signup
    Click Button    xpath=//input[@type='submit' and @value='Login']

Issue Book
    Click Link    Issue Book
    Input Text    id=book1    ${BookID}
    Input Text    id=studentid    ${StudentID}
    Click Button    xpath=//button[@type='submit']
    # Add verification or validation steps here, if needed.

Close Browser
    Close Browser

*** Keywords ***
Maximize Browser Window
    Maximize Browser Window
