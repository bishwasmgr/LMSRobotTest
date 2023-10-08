*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Test Cases ***
Log In Staff Member With Invalid Username
    Open Browser    http://localhost:8000/stafflogin/   Chrome
    Maximize Browser Window

    Input Text    id=loginuname    InvalidUsername    # Replace 'InvalidUsername' with an invalid username
    Input Text    id=loginpassword    secret123  # Use a valid password here

    Click Element    xpath=//input[@type='submit' and @value='Login']

    # Add verification steps here to ensure that an error message is displayed
    # You can check if the page shows an error message for an invalid username login attempt

    [Teardown]    Close Browser

Log In Staff Member With Invalid Password
    Open Browser    http://localhost:8000/stafflogin/   Chrome
    Maximize Browser Window

    Input Text    id=loginuname    testuser  # Use a valid username here
    Input Text    id=loginpassword    InvalidPassword  # Replace 'InvalidPassword' with an invalid password

    Click Element    xpath=//input[@type='submit' and @value='Login']

    # Add verification steps here to ensure that an error message is displayed
    # You can check if the page shows an error message for an invalid password login attempt

    [Teardown]    Close Browser

Log In Staff Member With Valid Credentials
    Open Browser    http://localhost:8000/stafflogin/   Chrome
    Maximize Browser Window

    Input Text    id=loginuname    testuser  # Use a valid username here
    Input Text    id=loginpassword    secret123  # Use a valid password here

    Click Element    xpath=//input[@type='submit' and @value='Login']

    # Add verification steps here to ensure successful login
    # You can check if the user is redirected to a dashboard page or if a success message is displayed

    [Teardown]    Close Browser

Log In Staff Member With Empty Credentials
    Open Browser    http://localhost:8000/stafflogin/   Chrome
    Maximize Browser Window

    Input Text    id=loginuname    ${EMPTY}    # Leave username empty
    Input Text    id=loginpassword    ${EMPTY}    # Leave password empty

    Click Element    xpath=//input[@type='submit' and @value='Login']

    # Add verification steps here to ensure that appropriate error messages are displayed
    # You can check if the page shows error messages for empty username and password

    [Teardown]    Close Browser

# Add more test scenarios here
