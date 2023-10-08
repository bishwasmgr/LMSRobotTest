*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           http://127.0.0.1:8000/stafflogin/
${Browser}       Chrome
${BOOKID}        2     # Replace with the desired Book ID


*** Test Cases ***

Open Website
    Open Browser    ${URL}    ${Browser}

Login to your Account
    Input Text    id=loginuname    testuser    # Use the same username as used during signup
    Input Text    id=loginpassword    secret123  # Use the same password as used during signup
    Click Element    xpath=//input[@type='submit' and @value='Login']

Return Books
    Click Link    Return Book  # Replace with the actual link text or locator for the "Add Student" page
    Input Text    id=bookid2    ${BookID}
    Click Button    xpath=//button[@type='submit' and text()='Submit']  # Click the "Submit" button

    # Close Browser
