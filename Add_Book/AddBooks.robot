*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           http://127.0.0.1:8000/stafflogin/
${Browser}       Chrome
${StudentName}   John Doe     # Replace with the desired student name
${StudentID}     S12345       # Replace with the desired student ID

# Book details
${BookID}        SampleBookID      # Replace with the desired book ID
${BookName}      Sample Book       # Replace with the desired book name
${Subject}       Sample Subject    # Replace with the desired subject
${Status}        Issued            # Replace with the desired status (Issued/Not-Issued)

*** Test Cases ***

Open Website
    Open Browser    ${URL}    ${Browser}

Login to your Account
    Input Text    id=loginuname    testuser    # Use the same username as used during signup
    Input Text    id=loginpassword    secret123  # Use the same password as used during signup
    Click Element    xpath=//input[@type='submit' and @value='Login']

Add Books
    Click Link    Add Book    
    Input Text    id=bookid    ${BookID}
    Input Text    id=bookname    ${BookName}
    Input Text    id=subject    ${Subject}
    Input Text    id=category    ${Status}
    Click Button    xpath=//button[@type='submit']


Open Dashboard and Check Book Details
    Click Link      Dashboard  # Update with the URL of your dashboard
    Page Should Contain    ${BookID}
    Page Should Contain    ${BookName}
    Page Should Contain    ${Subject}
    Page Should Contain    ${Status}
    # Close Browser

