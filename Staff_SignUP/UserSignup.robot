*** Settings ***
Library    SeleniumLibrary

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

Sign Up Staff Member With Duplicate Email
    Open Browser    http://localhost:8000/staffsignup/    Chrome
    Maximize Browser Window

    Input Text    id=uname    newuser123    # Provide a unique username
    Input Text    id=fname    John        # Replace 'John' with the desired first name
    Input Text    id=lname    Doe         # Replace 'Doe' with the desired last name
    Input Text    id=email    test@example.com    # Use an email that already exists
    Input Text    id=phone    1234567890  # Replace '1234567890' with the desired phone number
    Input Text    id=password    secret123  # Replace 'secret123' with the desired password

    Click Element    xpath=//input[@type='submit' and @value='Create']

    # Add verification steps here to ensure that an error message is displayed
    # You can check if the page shows an error message for a duplicate email

    [Teardown]    Close Browser


Sign Up Staff Member With Valid Data
    Open Browser    http://localhost:8000/staffsignup/    Chrome
    Maximize Browser Window

    Input Text    id=uname    newuser456    # Provide a unique username
    Input Text    id=fname    Alice       # Replace 'Alice' with the desired first name
    Input Text    id=lname    Smith       # Replace 'Smith' with the desired last name
    Input Text    id=email    newuser@example.com    # Provide a unique email
    Input Text    id=phone    9876543210  # Replace '9876543210' with the desired phone number
    Input Text    id=password    mypass123   # Replace 'mypass123' with the desired password

    Click Element    xpath=//input[@type='submit' and @value='Create']

    # Add verification steps here to ensure successful sign-up
    # You can check if the user is redirected to a confirmation page or a dashboard

    [Teardown]    Close Browser

Sign Up Staff Member With Weak Password
    Open Browser    http://localhost:8000/staffsignup/    Chrome
    Maximize Browser Window

    Input Text    id=uname    newuser789    # Provide a unique username
    Input Text    id=fname    Sarah       # Replace 'Sarah' with the desired first name
    Input Text    id=lname    Johnson     # Replace 'Johnson' with the desired last name
    Input Text    id=email    sarah@example.com    # Provide a unique email
    Input Text    id=phone    5555555555  # Replace '5555555555' with the desired phone number
    Input Text    id=password    weakpass   # Use a weak password

    Click Element    xpath=//input[@type='submit' and @value='Create']

    # Add verification steps here to ensure that an error message is displayed
    # You can check if the page shows an error message for a weak password

    [Teardown]    Close Browser


