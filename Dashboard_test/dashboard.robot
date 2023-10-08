*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Test Cases ***
Sign Up Staff Member With Invalid Data
    Open Browser    http://localhost:8000/staffsignup/    Chrome
    Maximize Browser Window

    Input Text    id=uname    ${EMPTY}    # Leave this empty for an invalid username
    Input Text    id=fname    John        # Replace 'John' with the desired first name
    Input Text    id=lname    Doe         # Replace 'Doe' with the desired last name
    Input Text    id=email    test@example.com    # Replace 'test@example.com' with the desired email
    Input Text    id=phone    1234567890  # Replace '1234567890' with the desired phone number
    Input Text    id=password    secret123  # Replace 'secret123' with the desired password

    Click Element    xpath=//input[@type='submit' and @value='Create']

    # Add verification steps here to ensure that an error message is displayed
    # You can check if the page shows an error message for an invalid signup attempt

    [Teardown]    Close Browser



Log In Staff Member With Valid Credentials
    Open Browser    http://localhost:8000/stafflogin/   Chrome
    Maximize Browser Window

    Input Text    id=loginuname    testuser    # Use the same username as used during signup
    Input Text    id=loginpassword    secret123  # Use the same password as used during signup

    Click Element    xpath=//input[@type='submit' and @value='Login']

    # Add verification steps here to ensure successful login
    # You can check if the user is redirected to a dashboard page

    [Teardown]    Close Browser

Check Dashboard After Login
    Open Browser    http://localhost:8000/dashboard/    Chrome
    Maximize Browser Window
    
    Input Text    id=loginuname    testuser    # Use the same username as used during signup
    Input Text    id=loginpassword    secret123  # Use the same password as used during signup

    Click Element    xpath=//input[@type='submit' and @value='Login']

    # Wait for specific elements to be visible with a timeout
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/addbook/')]    timeout=30s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/addstudent/')]    timeout=30s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/bookissue/')]    timeout=30s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/viewissuedbook/')]    timeout=30s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/viewstudents/')]    timeout=30s
    Wait Until Element Is Visible    xpath=//a[contains(@href, '/returnbook/')]    timeout=30s
    Wait Until Element Is Visible    xpath=//th[text()='Book Id']    timeout=30s
    Wait Until Element Is Visible    xpath=//th[text()='Book Name']    timeout=30s
    Wait Until Element Is Visible    xpath=//th[text()='Subject']    timeout=30s
    Wait Until Element Is Visible    xpath=//th[text()='Status']    timeout=30s
    Wait Until Element Is Visible    xpath=//th[text()='Edit']    timeout=30s
    Wait Until Element Is Visible    xpath=//th[text()='Delete']    timeout=30s

    # Check the presence of links and elements on the dashboard page
    Element Should Be Visible    xpath=//a[contains(@href, '/addbook/')]
    Element Should Be Visible    xpath=//a[contains(@href, '/addstudent/')]
    Element Should Be Visible    xpath=//a[contains(@href, '/bookissue/')]
    Element Should Be Visible    xpath=//a[contains(@href, '/viewissuedbook/')]
    Element Should Be Visible    xpath=//a[contains(@href, '/viewstudents/')]
    Element Should Be Visible    xpath=//a[contains(@href, '/returnbook/')]
    Element Should Be Visible    xpath=//th[text()='Book Id']
    Element Should Be Visible    xpath=//th[text()='Book Name']
    Element Should Be Visible    xpath=//th[text()='Subject']
    Element Should Be Visible    xpath=//th[text()='Status']
    Element Should Be Visible    xpath=//th[text()='Edit']
    Element Should Be Visible    xpath=//th[text()='Delete']

    [Teardown]    Close Browser


*** Keywords ***
Sleep
    [Arguments]    ${seconds}
    Sleep    ${seconds}
