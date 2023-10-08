*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           http://localhost:8000/stafflogin/  # Update with your local server URL
${Browser}       Chrome
${StudentName}   John Doe             # Replace with the desired student name
${StudentID}     S12345               # Replace with the desired student ID

*** Test Cases ***
Test Adding a Valid Student
    [Documentation]    Test adding a student with valid details
    [Tags]    AddStudent
    Open Browser    ${URL}    ${Browser}
    Input Text    id=loginuname    testuser    # Use the same username as used during signup
    Input Text    id=loginpassword    secret123  # Use the same password as used during signup
    Click Element    xpath=//input[@type='submit' and @value='Login']
    Click Link    Add Student
    Input Text    id=sname    New Student
    Input Text    id=studentid    S67890
    Click Button    xpath=//button[@type='submit']
    # Add verification steps here, e.g., check for a success message
    Close Browser

Test Adding a Student with Existing ID
    [Documentation]    Test adding a student with an existing ID
    [Tags]    AddStudent
    Open Browser    ${URL}    ${Browser}
    Input Text    id=loginuname    testuser    # Use the same username as used during signup
    Input Text    id=loginpassword    secret123  # Use the same password as used during signup
    Click Element    xpath=//input[@type='submit' and @value='Login']
    Click Link    Add Student
    Input Text    id=sname    Duplicate Student
    Input Text    id=studentid    ${StudentID}  # Use the same ID as a previous student
    Click Button    xpath=//button[@type='submit']
    # Add verification steps here for error handling
    Close Browser

TTest Adding a Student with Empty Name
    [Documentation]    Test adding a student with an empty name
    [Tags]    AddStudent
    Open Browser    ${URL}    ${Browser}
    Input Text    id=loginuname    testuser    # Use the same username as used during signup
    Input Text    id=loginpassword    secret123  # Use the same password as used during signup
    Click Element    xpath=//input[@type='submit' and @value='Login']
    Click Link    Add Student
    Input Text    id=studentid    Empty Name Student
    Click Button    xpath=//button[@type='submit']
    # Add verification steps here for error handling
    Close Browser